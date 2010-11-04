#!/bin/bash
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

crawl_dep=$1
crawlname_from_jsp=$2
archieve_dir="/home/crawler/crawlzilla/archieve"
tmp_dir="/home/crawler/crawlzilla/.tmp"

if [ "$1" == "" ]; then
 echo "1. 使用這個shell ，首先你需要有crawler這個使用者，並且hadoop 已經開始運作";
 echo "2. /home/crawler/crawlzilla/url/urls.txt 裡面有你要抓的網址";
 echo "3. 執行 ./go.sh [深度] [資料夾名稱] 即可，如：";
 echo "	./go.sh 3 crawlname"
 echo "4. 等nutch所有程序完成，則你的資料在 $archieve_dir/crawlname/ "
 exit
fi

source "/opt/crawlzilla/nutch/conf/hadoop-env.sh";
source "/home/crawler/crawlzilla/system/log.sh" crawl_go;

function checkMethod(){
  if [ $? -eq 0 ];then
    show_info "$1 is ok";
  else
    echo "error: $1 broken" > "$tmp_dir/$crawlname_from_jsp/$crawlname_from_jsp"
    show_info "error: $1 broken"
    kill -9 $count_pid
    exit 8
  fi
}

cd /home/crawler/crawlzilla/

echo $$ > $tmp_dir/$crawlname_from_jsp/$crawlname_from_jsp'_go_pid'

read
checkMethod "import lib path"
# 策略改變 不用檢查
#if [ -e /home/crawler/crawlzilla/search ];then
    # 不是第一次搜尋，刪除hdfs上的資料夾
#    echo "delete search (local,hdfs) and urls (hdfs) "
#    echo "not first time"
#    FirstTime=2;
#else
    # 第一次搜尋，設定參數，以後使用
#    echo "first time set"
#    FirstTime=1;
#fi


# $archieve_dir/tmp 用來放該程序的狀態
if [ ! -e $tmp_dir ];then
   mkdir $tmp_dir
   checkMethod "mkdir .tmp"
fi

# 存儲crawling狀態及花費時間的資料夾
if [ ! -e "$tmp_dir/$crawlname_from_jsp" ];then
   mkdir "$tmp_dir/$crawlname_from_jsp"
   checkMethod "mkdir crawlStatusDir"
fi

# 紀錄爬取深度
echo $1 > $tmp_dir/$crawlname_from_jsp/.crawl_depth

# 開始紀錄程序狀態
echo "begin" > "$tmp_dir/$crawlname_from_jsp/$crawlname_from_jsp"
echo "0" > $tmp_dir/$crawlname_from_jsp/$crawlname_from_jsp'PassTime'

# 呼叫counter.sh紀錄時間
/home/crawler/crawlzilla/system/counter.sh $crawlname_from_jsp &
sleep 5
count_pid=$(cat $tmp_dir/$crawlname_from_jsp/$crawlname_from_jsp'_count_pid')

# check the replicate directory on HDFS ; $? : 0 = shoud be delete
/opt/crawlzilla/nutch/bin/hadoop fs -test -e /user/crawler/$crawlname_from_jsp
if [ $? -eq 0 ]; then
  /opt/crawlzilla/nutch/bin/hadoop dfs -rmr /user/crawler/$crawlname_from_jsp
  show_info "/user/crawler/$crawlname_from_jsp is deleted."
fi

/opt/crawlzilla/nutch/bin/hadoop dfs -mkdir $crawlname_from_jsp
checkMethod "hadoop dfs -mkdir $crawlname_from_jsp"

/opt/crawlzilla/nutch/bin/hadoop dfs -put /home/crawler/crawlzilla/urls $crawlname_from_jsp/urls
checkMethod "hadoop dfs -put urls"

# nutch crawl begining
echo "crawling" > $tmp_dir/$crawlname_from_jsp/$crawlname_from_jsp

/opt/crawlzilla/nutch/bin/nutch crawl $crawlname_from_jsp/urls -dir $crawlname_from_jsp -depth $crawl_dep -topN 5000 -threads 1000
checkMethod "nutch crawl"
/opt/crawlzilla/nutch/bin/hadoop dfs -get $crawlname_from_jsp $archieve_dir/$crawlname_from_jsp
checkMethod "download search"

# 製作 $crawlname_from_jsp 於 tomcat
cp -rf /opt/crawlzilla/tomcat/webapps/default /opt/crawlzilla/tomcat/webapps/$crawlname_from_jsp
checkMethod "cp default to "
sed -i '8s/search/'${crawlname_from_jsp}'/g' /opt/crawlzilla/tomcat/webapps/$crawlname_from_jsp/WEB-INF/classes/nutch-site.xml
checkMethod "sed"

# 完成搜尋狀態
cp $tmp_dir/$crawlname_from_jsp/.crawl_depth $archieve_dir/$crawlname_from_jsp/
cp $tmp_dir/$crawlname_from_jsp/$crawlname_from_jsp'PassTime' $archieve_dir/$crawlname_from_jsp/
echo "finish" > $tmp_dir/$crawlname_from_jsp/$crawlname_from_jsp

kill -9 $count_pid

# 花費時間
#TempTime=$(date +%s)
#PassTime=$(( $TempTime - $StartTime ))
#echo $PassTime > $tmp_dir/$crawlname_from_jsp/$crawlname_from_jsp'PassTime'



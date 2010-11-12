#!/bin/bash

# prompt
if [ "$1" == "" ];then
    echo "Usage : fix <JOB_NAME>";
    echo " where JOB_NAME is one of: ";
    echo "==========="
    NN=$(/opt/crawlzilla/nutch/bin/hadoop dfs -ls |grep crawler |awk '{print $8}' | cut -d "/" -f 4)
    echo "$NN"
    echo "==========="
    exit 9;
fi

# define
source "/opt/crawlzilla/nutch/conf/hadoop-env.sh";
source "/home/crawler/crawlzilla/system/log.sh" job_fix;

### local
JNAME=$1
META_PATH="/home/crawler/crawlzilla/.metadata"
HADOOP_BIN="/opt/crawlzilla/nutch/bin"

JPID=$(cat "$META_PATH/$JNAME/$JNAME"_go_pid) # go job pid 
CPID=$(cat "$META_PATH/$JNAME/$JNAME"_count_pid) # count pid 
JDEPTH="$META_PATH/$JNAME/.crawl_depth" # depth
JPTIME="$META_PATH/$JNAME/$JNAME"PassTime
STATUS_FILE=$META_PATH/$JNAME/$JNAME # status path

### function
function check_info ( )
{
  if [ $? -eq 0 ];then
    show_info "[ok] $1";
  else
    echo "error: $1 broken" > "$META_PATH/$JNAME/$JNAME"
    show_info "[error] $1 broken"
    kill -9 $CPID
    exit 8
  fi
}

### program

DATE=$(date)
show_info "Fix $JNAME BEGIN at $DATE"

show_info "0 kill ps" 
kill -9 $JPID >/dev/null 2>&1
if [ ! $? -eq 0 ];then debug_info "Warning!!! kill go.sh not work"; fi
kill -9 $CPID >/dev/null 2>&1
if [ ! $? -eq 0 ];then debug_info "Warning!!! kill count.sh not work"; fi
echo "fixing" > $STATUS_FILE;


show_info "0 Correcting Information "

SEGS=$($HADOOP_BIN/hadoop dfs -ls /user/crawler/$JNAME/segments | grep  segments | awk '{print $8 }')

# checking the contents in $JNAME/segments/ , or hadoop will broken
# content , crawl_fetch , crawl_generate , crawl_parse , parse_data, parse_text

SEOK=""
for SE in $SEGS
do
 show_info "checking $SE"
 if $HADOOP_BIN/hadoop dfs -test -d $SE/content && \
 $HADOOP_BIN/hadoop dfs -test -d $SE/crawl_fetch && \
 $HADOOP_BIN/hadoop dfs -test -d $SE/crawl_generate && \
 $HADOOP_BIN/hadoop dfs -test -d $SE/crawl_parse && \
 $HADOOP_BIN/hadoop dfs -test -d $SE/parse_data && \
 $HADOOP_BIN/hadoop dfs -test -d $SE/parse_text ;then
   show_info "$SE .... [Fine] "
   SEOK="$SEOK "$SE
 fi
done
debug_info "SEOK =[ $SEOK ]"

## [ Do FIX Process ] if at least one correct Segments in pool ##
if [ ! "$SEOK" == "" ];then

## begin FIX
   
show_info "1 invertlinks"
$HADOOP_BIN/nutch invertlinks /user/crawler/$JNAME/linkdb -dir /user/crawler/$JNAME/segments/
check_info "invertlinks "

show_info "2 index" 
$HADOOP_BIN/nutch index /user/crawler/$JNAME/index /user/crawler/$JNAME/crawldb /user/crawler/$JNAME/linkdb $SEOK
check_info "index DB "

show_info "3 dedup" 
$HADOOP_BIN/nutch dedup /user/crawler/$JNAME/index
check_info "dedup "

show_info "4 download"
$HADOOP_BIN/hadoop dfs -get $JNAME /home/crawler/crawlzilla/archieve/$JNAME
check_info "download hdfs "


show_info "4.1 $JNAME PassTime"
if [ ! -f /home/crawler/crawlzilla/archieve/$JNAME/$JNAME"PassTime" ];then
  if [ -f $JPTIME ];then
    cp $JPTIME /home/crawler/crawlzilla/archieve/$JNAME/$JNAME"PassTime"
  else
    echo "0h:0m:0s" >> /home/crawler/crawlzilla/archieve/$JNAME/$JNAME"PassTime"
  fi
fi

show_info "4.2 append depth"
if [ ! -f /home/crawler/crawlzilla/archieve/$JNAME/.crawl_depth ];then
  if [ -f $JDEPTH ];then
    cp $JDEPTH /home/crawler/crawlzilla/archieve/$JNAME/.crawl_depth
  else
    echo "0" >> /home/crawler/crawlzilla/archieve/$JNAME/.crawl_depth
  fi
fi

show_info "5 mv index files from part-00000"
mv /home/crawler/crawlzilla/archieve/$JNAME/index/part-00000/* /home/crawler/crawlzilla/archieve/$JNAME/index/
check_info "mv index files from part-00000 "

show_info "6 rmdir part-00000/"
rmdir /home/crawler/crawlzilla/archieve/$JNAME/index/part-00000/
check_info "rmdir part-00000/ "

show_info "7 tomcat nutch search index "
cp -rf /opt/crawlzilla/tomcat/webapps/default /opt/crawlzilla/tomcat/webapps/$JNAME
check_info "tomcat nutch search index"

show_info "8 nutch-site.xml"
sed -i '8s/search/'${JNAME}'/g' /opt/crawlzilla/tomcat/webapps/$JNAME/WEB-INF/classes/nutch-site.xml
check_info "nutch-site.xml modify"

fi
## hadoop fix over ##

echo "stop" > $STATUS_FILE;

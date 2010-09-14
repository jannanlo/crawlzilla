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

indexPoolName=$1

if [ -d /home/crawler/crawlzilla/archieve/$indexPoolName ]; then
  depth=$(cat /home/crawler/crawlzilla/archieve/$indexPoolName/.crawl_depth)
  cp /home/crawler/crawlzilla/archieve/$indexPoolName/urls/urls.txt /home/crawler/crawlzilla/urls
  rm -rf /home/crawler/crawlzilla/.tmp/$indexPoolName
  rm -rf /opt/crawlzilla/tomcat/webapps/$indexPoolName
  /opt/crawlzilla/nutch/bin/hadoop fs -rmr /user/crawler/$indexPoolName
  ./go.sh $depth $indexPoolName
else
  echo "No Parameter of File not Find!"
fi


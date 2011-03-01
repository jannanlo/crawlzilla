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

Begin=0
JNAME=$1
META_DIR="/home/crawler/crawlzilla/.metadata"
echo $$ > $META_DIR/$JNAME/count.pid

while [ 1 ]
  do
    sleep 1
    Begin=$(expr $Begin + 1)
    Min=$(expr $Begin / 60)
    Hour=$(expr $Min / 60)
    Min=$(expr $Min % 60)
    Sec=$(expr $Begin % 60)
    echo $Hour'h:'$Min'm:'$Sec's' > $META_DIR/$JNAME/passtime
  done

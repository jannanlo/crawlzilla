# 【 系統管理介面操作說明 】 #

  * 此一說明頁面操作環境為兩台已安裝好之叢集環境

  * 單機版操作方式皆同。



## 【 系統運算架構】 ##

  * 已熟悉Hadoop架構之使用者可略過此一段落

  * 由於底層的運算是交由Hadoop作運算，相關的運算原理可參考[Hadoop官方網頁說明](http://hadoop.apache.org/common/docs/current/hdfs_design.html)

  * 若無法了解上述運算架構及原理，僅需記住以下啟動順序即可。

```
Step1. 啟動Namnode & Jobtracker
Step2. 啟動Datanode & Tasktracker
```

  * 系統安裝完成時，運算節點預設為關閉，需透過系統管理介面開啟服務，執行網頁爬取前，請先確認Hadoop相關運算服務已開啟，否則將無法順利執行。

# 【 系統管理介面功能 】 #

在PC1終端機中輸入指令-"crawlzilla"即可進入系統管理介面如下圖：

![http://crawlzilla.googlecode.com/svn/tags/pics/wiki/ShellAdm/1.png](http://crawlzilla.googlecode.com/svn/tags/pics/wiki/ShellAdm/1.png)

此一管理介面提供數個系統管理功能，於下列子段落一一說明。
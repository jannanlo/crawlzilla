# 【1.建立第一個搜尋引擎】 #

## 【Step 1.1.開啟所有運算服務】 ##

由於執行Crawl必須透過Hadoop運算，因此執行Crawl前請先依序確認以下服務是否已開啟，若為關閉狀態，請依序開啟這些服務。

  * Namenode and Jobtracker

  * Datanode and Tasktracker(需開啟全部的運算節點)

若不熟悉開啟步驟，請參考[wiki:crawlzilla/sysmanagement\_zh 系統管理介面操作說明]

## 【Step 1.2.至Crawl網頁中設定爬取項目】 ##

  * 依序填入：索引庫名稱，欲抓取的網址（可多行，如圖所示）及設定爬取深度即可送出

![http://crawlzilla.googlecode.com/svn/tags/pics/wiki/WebMan/3.png](http://crawlzilla.googlecode.com/svn/tags/pics/wiki/WebMan/3.png)

  * 送出後如圖所示，等候時間需視視每台主機的運算速度而定。

![http://crawlzilla.googlecode.com/svn/tags/pics/wiki/WebMan/4.png](http://crawlzilla.googlecode.com/svn/tags/pics/wiki/WebMan/4.png)

## 【Step 1.3.瀏覽網頁爬取進度】 ##

  * 透過系統狀態頁面，可即時了解網頁爬取進度

![http://crawlzilla.googlecode.com/svn/tags/pics/wiki/WebMan/5.png](http://crawlzilla.googlecode.com/svn/tags/pics/wiki/WebMan/5.png)

  * 待出現"Finish"表示索引庫已建立，並可將此一訊息刪除

![http://crawlzilla.googlecode.com/svn/tags/pics/wiki/WebMan/6.png](http://crawlzilla.googlecode.com/svn/tags/pics/wiki/WebMan/6.png)

  * 完成此一步驟，第一個搜尋引擎已建置，右側快速連結中的"tracCloud\_and\_nchcTW\_3"即為此次所建立的搜尋引擎。

## 【Step 1.4.測試搜尋引擎功能】 ##

  * 點選右側快速連結中的"tracCloud\_and\_nchcTW\_3"進入搜尋引擎後，輸入一組關鍵字測試搜尋結果，下圖為輸入"nchc"為例：

![http://crawlzilla.googlecode.com/svn/tags/pics/wiki/WebMan/7.png](http://crawlzilla.googlecode.com/svn/tags/pics/wiki/WebMan/7.png)

  * 搜尋結果：

![http://crawlzilla.googlecode.com/svn/tags/pics/wiki/WebMan/8.png](http://crawlzilla.googlecode.com/svn/tags/pics/wiki/WebMan/8.png)
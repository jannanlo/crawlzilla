# Crawlzilla 2.1.0 Change Log #
< {shunfa} _at_ narl.nchc.org.tw > 5 Aug 2013
  * 更新Nutch核心版本至1.6
  * 整合Solr4.0

# Crawlzilla 1.0.0 Change Log #
< { waue, shunfa } _at_ nchc.org.tw > 4 Jul 2011
  * 更新Nutch核心版本1.2
  * 多人共享：只需要申請一個帳號即可擁有自己的搜尋引擎
  * 系統排程：系統任務設定完成後，可設定是否要即時執行，或預約Job的爬取時間
  * 索引庫自動更新：設定更新頻率，讓搜尋引擎隨時擁有最新的資訊
  * 軟體自動更新：自動偵測更新Crawlzilla管理版本
  * email通知會員帳號狀態(安裝及註冊時請務必留下正確的email資訊)
  * 即時體驗網址：http://demo.crawlzilla.info/
  * more info see [here](https://trac.nchc.org.tw/cloud/wiki/crawlzilla/v1.0_relasedNote)
# Crawlzilla 0.3.0 Change Log #
< { rock, waue, shunfa } _at_ nchc.org.tw > 22 Nov 2010

  * change : 5 style
  * fix : more then 10 bugs

# Crawlzilla 0.3.0 beta Change Log #
< { rock, waue, shunfa } _at_ nchc.org.tw > 22 Nov 2010

  * 增加：slave 系統開/關機 ，自動 加入/停止 其工作程序
  * 增加：crawling 時若超過3小時，而running jobs 卻又沒有工作在做時，會出現 stop job 的按鈕，進入收尾動作
  * 增加：啟動/停止　hadoop 的程序都會自動檢查狀態是否正常
  * 增加：支援更多程序的日誌功能，以便除錯
  * 改變：會自動檢查是否有相依的套件，有才引入套件庫安裝該套件，無則略過，可以減少更多安裝時間
  * 改變：以前Client\_xxx 的字眼全改為 Slave\_xxx ，以呈現雲端服務之 master-slave-client 三種關係
  * 警告：crawlzilla 0.3.x 與舊版 0.2.x 的檔名、目錄有些變動，因此舊版的索引套件庫無法用於 0.3.x 版本
  * 修復：超過 20 隻以上的 bugs


# crawlzilla 0.2.2 #
< { rock, waue, shunfa } _at_ nchc.org.tw > 13 Oct 2010

**verified to support for Ubuntu, Debian, OpenSuse, CentOS, Fedora, CentOS** added: setting user name and email to configuration file
**added: appending system version to log file** added: showing crawling depth on Nutch\_DB page
**fix 16 bugs and modified 4 mechanisms.**

# crawlzilla 0.2.1.1 #
< { rock, waue, shunfa } _at_ nchc.org.tw > 01 Oct 2010

**tryed to support for OpenSuse, CentOS, Fedora, CentOS** added record crawling time and
**added recrawl function** improved startup/shutdown all services faster
**fixed 20 bugs , modified 7 mechanisms.**

# crawlzilla 0.2.1 #
< { rock, waue, shunfa } _at_ nchc.org.tw > 08 Aug 2010

Main functions were tested fine on Ubuntu and Debian.

---

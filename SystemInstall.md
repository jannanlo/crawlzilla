# 【Crawlzilla 單機安裝步驟】 #

  * 安裝 Crawlzilla 在一台電腦上運作，功能與穩定性不會比安裝在多台電腦上少，兩者差別僅於分析大型網站的效率而已。因此，安裝Crawlzilla 在單機上是使用者或體驗者建議的選項。安裝的過程非常簡單，只需彈指的四步間即可完成（已安裝sun-java-6 的前提下）。

  * 如果你要讓Crawlzilla安裝於兩台以上的叢集系統，請看 [Crawlzilla叢集安裝步驟](http://code.google.com/p/crawlzilla/wiki/ClusterInstall)

## 【Step 1. 取得安裝檔】 ##

  * [取得crawlzilla最新安裝檔 ](http://sourceforge.net/projects/crawlzilla/files_beta/stable/Crawlzilla-0.2/)

## 【Step 2. 解壓縮並執行安裝程式】 ##
  * 參考指令如下：
```
tar zxvf Crawlzilla-0.2*.tar.gz
./Crawlzilla_Install/install
```

> ps :  此指令會切換成sudoer ，因此有可能會要您的 sudoer 密碼

## 【Step 3. 設定密碼及確認網路資訊】 ##

  * 此一步驟將會在系統中新建一組user帳號-crawler，系統服務及叢集間的溝通將會已此一帳號密碼作為執行身份。

  * 設定密碼並確認網路狀態資訊後，等候完成安裝即可。

  * 畫面如下：

![http://crawlzilla.googlecode.com/svn/tags/pics/wiki/SysIns/1.png](http://crawlzilla.googlecode.com/svn/tags/pics/wiki/SysIns/1.png)

  * 待出現"恭喜您完成Crawlzilla安裝,按Enter鍵離開..."即表示單機環境已安裝完成！安裝完成後開啟網頁將會顯示畫面如下：
![http://crawlzilla.googlecode.com/svn/tags/pics/wiki/SysIns/6.png](http://crawlzilla.googlecode.com/svn/tags/pics/wiki/SysIns/6.png)

# 【註解】 #

  * 單機版安裝程序完成後，系統將會自動開啟tomcat服務及hadoop中的namenode及jobtracker，若要執行網頁crawl功能需自行透過系統管理介面開啟datanode及tasktracker。

last modified: 2010/08/25
# 【Crawlzilla 叢集安裝說明】 #

用一台普通pc (core 2 CPU , 2G Mem ) 安裝了 Crawlzilla 的主機，去爬取總資料量約200MB的任務，需要6 個小時。因此，如果你的搜尋需求更大，即時性更急迫些，你可以考慮用叢集運作的方式來平行分散工作到多台電腦去運算。

要完成安裝 Crawlzilla 的叢集模式一點都不複雜，只要注意安裝步驟即可。概念是，安裝的第一台為Master，此台也可以獨立執行運作全部的服務，方法與 [Crawlzilla 單機系統安裝說明](http://code.google.com/p/crawlzilla/wiki/SystemInstall) 內容一模一樣；第二台以上的電腦，則利用Master所產生出來的\*Client安裝包\*來完成安裝；之後就可以用Crawlzilla 的管理工具輕鬆的\*動態**[新增＼移除]運算節點囉！**

你會發現 **A 安裝Master Server** 與單機安裝的步驟方法是一模一樣的，因此如果你已經操作了 Crawlzilla 單機系統安裝說明，之後又想要再加入第二、三....多個節點，可以直接跳到【 Step B . 安裝 Slave 節點】分別執行即可

## 【安裝前的小提醒】 ##

  * <font color='red'>硬體規格</font>**建議：記憶體 1.5G以上
  ***<font color='red'>作業系統</font>**建議：[請參考測試成功的作業系統](http://code.google.com/p/crawlzilla/wiki/Support_Distribution)
  ***<font color='red'>系統環境</font>**設定：
    ***修改主機名稱**(建議不要用 localhost 作為主機名稱)
      * 若系統為 debian 或 ubuntu (底下的 {hostname} 請修改成您要的主機名稱)
```
$ su -
# cat {hostname} > /etc/hostname
# /etc/init.d/hostanme restart
// debian 則為 /etc/init.d/hostanme.sh restart
// 建議登出再登入，讓修改的主機名稱生效
```
      * 若系統為 Fedora 或 CentOS (底下的 {hostname} 請修改成您要的主機名稱)
```
$ su -
# vim /etc/sysconfig/network
HOSTNAME={hostname}

# hostname {hostname}
// 建議登出再登入，讓修改的主機名稱生效
```
    ***確認 /etc/hosts**的**主機名稱**和**IP位址**也是正確的對應
```
# cat /etc/hosts
127.0.0.1 localhost
140.100.X.X {hostname}
```**

## 【安裝時需要的套件】 ##

  * 系統會自動檢查<font color='red'> openssh, openssh-server, Sun 6 Java </font>**套件是否有安裝，並試著自動安裝 （ubuntu, debian），若其他系統無法自動安裝，使用者需自行手動安裝
    * 由於 Sun 6 Java 是版權軟體，因此某些linux版本預設無法安裝
      * Ubuntu 10.04 安裝可參考以下指令
```
sudo add-apt-repository "deb http://archive.canonical.com/ lucid partner"
sudo apt-get update
sudo apt-get install sun-java6-jdk sun-java6-plugin
sudo update-java-alternatives -s java-6-sun
```
      * Fedora 和 CentOS 再安裝 crawlzilla 過程中會自動安裝

---**

## 【A 安裝Master Server 】 ##

此一安裝過程將假設欲安裝crawlzilla單機版於PC1中

### 【Step A1. 取得安裝檔】 ###

  * [取得crawlzilla最新安裝檔 ](http://sourceforge.net/downloads/crawlzilla/stable/)

### 【Step A2. 解壓縮並執行安裝程式】 ###
  * 參考指令如下：
```
tar zxvf Crawlzilla-0.2-100813-Shell.tar.gz
./Crawlzilla_Install/install
```

### 【Step A3. 設定密碼及確認網路資訊】 ###

  * 此一步驟將會在系統中新建一組user帳號-crawler，系統服務及叢集間的溝通將會已此一帳號密碼作為執行身份。

  * 設定密碼並確認網路狀態資訊後，等候完成安裝即可。

  * 畫面如下：

![http://crawlzilla.googlecode.com/svn/tags/pics/wiki/SysIns/1.png](http://crawlzilla.googlecode.com/svn/tags/pics/wiki/SysIns/1.png)

  * 待出現"恭喜您完成Crawlzilla安裝,按Enter鍵離開..."即表示單機環境已安裝完成！安裝完成後開啟網頁將會顯示畫面如下：
![http://crawlzilla.googlecode.com/svn/tags/pics/wiki/SysIns/6.png](http://crawlzilla.googlecode.com/svn/tags/pics/wiki/SysIns/6.png)


---


## 【Step B  安裝 Slave 節點】 ##


### 【Step B1. 透過PC1取得安裝提示】 ###

  * 於client端執行"ssh PC1"，並執行 "crawlzilla" 指令，找到"client安裝步驟"，如下圖所示：
![http://crawlzilla.googlecode.com/svn/tags/pics/wiki/SysIns/2.png](http://crawlzilla.googlecode.com/svn/tags/pics/wiki/SysIns/2.png)

  * 相關提示字元範例如下：

```
$ scp crawler@PC1:/home/crawler/crawlzilla/source/client_deploy.sh .
$ ./client_deploy.sh
```

  * 由於此一步驟需以crawler的身份ssh至PC1，因此過程中約需輸入1～2次crawler密碼

### 【Step B2. 於PC2執行上述之提示字元】 ###

  * 取得提示執行後輸入主機之clawer密碼兩次並確認網路資訊即可自動完成安裝

執行畫面如下：

  * 確認安裝資訊

![http://crawlzilla.googlecode.com/svn/tags/pics/wiki/SysIns/3.png](http://crawlzilla.googlecode.com/svn/tags/pics/wiki/SysIns/3.png)

  * 輸入密碼

![http://crawlzilla.googlecode.com/svn/tags/pics/wiki/SysIns/4.png](http://crawlzilla.googlecode.com/svn/tags/pics/wiki/SysIns/4.png)

  * 安裝完成

![http://crawlzilla.googlecode.com/svn/tags/pics/wiki/SysIns/5.png](http://crawlzilla.googlecode.com/svn/tags/pics/wiki/SysIns/5.png)

### 【Step B3. 驗證是否安裝成功】 ###

  * 於PC1執行指令-"crawlzilla"，出現以下畫面後選擇 "檢查Cluster 狀態"，畫面如下：

![http://crawlzilla.googlecode.com/svn/tags/pics/wiki/SysIns/7.png](http://crawlzilla.googlecode.com/svn/tags/pics/wiki/SysIns/7.png)

  * 若出現2個運算節點表示安裝成功！

![http://crawlzilla.googlecode.com/svn/tags/pics/wiki/SysIns/8.png](http://crawlzilla.googlecode.com/svn/tags/pics/wiki/SysIns/8.png)

# 【註解】 #

  * 叢集版安裝完成後，需回PC1執行系統管理介面開啟運算服務後才可加入crawl運算分派資源中。
  * 第三個運算節點以上的安裝方式，則是重複步驟B即可
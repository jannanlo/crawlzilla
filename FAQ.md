## 無法解析網址上的中文文件檔案 ？ ##
A: 檔案編碼需要UTF-8格式，如果檔案或網頁的編碼是Big5或是BG2312則無法解析

## 更新後的網頁內容，無法被搜尋到？ ##
A: 再爬取一次即可

## 可以用在 Windows 上嗎？ ##
A: 本專案目前只開發 Linux 版本

## 安裝到一半出現錯誤，如何重新安裝？ ##
A: 請在終端機內，使用 crawlzilla\_remove 這個指令移除。<br>
ps 如果系統找不到這個指令，則請按照情況<br>
<ul><li>master主機：請到解壓縮後的安裝包內的 bin/master_remove<br>
</li><li>slave(client)主機：請到解壓縮後的安裝包內的 bin/client_remove</li></ul>

<h2>安裝過crawlzilla的機器因為換位置而變了IP，該怎麼設置？</h2>
A: 在新的環境內移除掉crawlzilla後重新安裝即可<br>
<br>
<h2>Crawlzilla 安裝在叢集與單機的差別？</h2>
A: 叢集的效率較好<br>
<br>
<h2>我將 Crawlzilla 安裝在叢集環境下，但server loading 很重，client 倒還好，怎麼調整？</h2>
A: 停掉 server 的運算功能，方法如下<br>
<pre><code>到 server 主機 -&gt; 執行 crawlzilla -&gt; 設定 datanode &amp; tasktracker <br>
-&gt; part -&gt; 挑選server 那台 -&gt; shutdown<br>
</code></pre>
<h2>我原本在使用crawlzilla 的環境是單機環境，但使用了一陣子後想變成叢集模式，是否要重新安裝？</h2>
A: 不用重新安裝，只需要讓新加入的機器安裝crawlzilla 的client 版本即可<br>
<br>
<h2>在安裝的過程中，有設定crawler的密碼與第一次登入管理網頁上設定的網頁密碼，請問是同一個嗎？</h2>
A: 系統上的 crawler 密碼與網頁的密碼不同，前者是系統使用者 crawler的密碼，建議輸入長密碼以符合系統安全性，後者是使用crawlzilla網頁服務的密碼<br>
<br>
<h2>安裝 crawlzilla 是否增加被駭客入侵的風險？</h2>
A: crawlzilla 會建立一個系統使用者 crawler ，因此此帳號的密碼必須設定為強密碼（長度超過6，不為常用字，英數混雜），否則會有駭客用暴力密碼嘗試器闖入你的系統<br>
<br>
<h2>crawlzilla 的client 程式為何在網頁上下載不到，放在哪邊？</h2>
A: 當安裝完 crawlzilla 的 server 之後，會在該台機器的 /home/crawler/crawlzilla/source/ 自動產生出給 client 安裝的安裝程式<br>
<br>
<h2>為何當我用crawlzilla將叢集內的某個節點退出運算後，進行網路爬取會出錯？</h2>
A: 因為crawlzilla 所用的Hadoop專案需要等一段時間之後才能判定該節點真的失效，因此一將某節點停止運算，隨即發送爬網任務，則系統會依然將任務丟給此被停掉的節點導致出錯，解決的方法就是停掉運算節點後，過五分鐘後再進行爬取<br>
<br>
<h2>目前是否支援其他協定(如：ftp、samba...等)？</h2>
A: 預設是不啟動，但是可設定相關的設定檔來支援這些協定的搜尋
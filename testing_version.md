# 從 SVN 安裝 Crawlzilla #

  * 可使用 svn checkout 下載最新測試版的 Crawlziila
```
$ svn checkout http://crawlzilla.googlecode.com/svn/trunk/ crawlzilla-read-only
```

  * 打包 Crawlzilla 安裝檔
```
$ ./build-crawlzilla.sh
```

  * 碎碎念：
    * 若想開發自己的 Crawlzilla，可於修改程式碼後再使用 build-crawlzilla.sh 來打包自己的安裝檔
    * 若有其它使用者開發出很屌的功能，也拜請諸位各路大大將 code 回饋一下給我們團隊拉，感恩了 :)
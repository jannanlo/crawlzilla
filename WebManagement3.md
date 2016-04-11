# 【3.在網頁中嵌入搜尋引擎】 #

若企業內部有需要將Search Bar整合於企業首頁中，則可使用此一功能，方式如下：

### 【Step 3.1.開啟索引庫管理頁面】 ###

![http://crawlzilla.googlecode.com/svn/tags/pics/wiki/WebMan/14.png](http://crawlzilla.googlecode.com/svn/tags/pics/wiki/WebMan/14.png)

### 【Step 3.2.點選embed code】 ###

![http://crawlzilla.googlecode.com/svn/tags/pics/wiki/WebMan/15.png](http://crawlzilla.googlecode.com/svn/tags/pics/wiki/WebMan/15.png)

### 【Step 3.3.複製後貼在欲整合Search Bar的頁面】 ###

  * embed code範例：

```
<img src="http://140.110.138.186:8080/crawlzilla/img/logo.png" >
<form name="search" action="http://140.110.138.186:8080/nchc-en_3/search.jsp" method="get">
<input name="query" size=15>
</form>
```

last modified: 2010/08/25
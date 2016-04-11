# 單機移除 #

打開終端機，用\*root帳號\*或有\*sudoer\*權限的帳號輸入
```
   crawlzilla_remove
```

sudoer 帳號需要輸入該帳號的密碼，等程式跑完就移除完囉！


# 叢集移除 #

## 導覽 ##
  * Crawlzilla 的叢集是主（master）-從（slave）架構的服務模式，因此移除的時候，先將所有slave 移除之後，最後再移除 master。

  * master與slave 的移除都是輸入指令

```
   crawlzilla_remove
```

## Slave 移除方法 ##

移除方法同 單機移除

## Master 移除方法 ##

請先確認所有的 Slave 都已經移除crawlzilla 完畢後，再執行移除程式 **crawlzilla\_remove**

移除方法同 單機移除
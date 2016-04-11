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

  * 系統會自動檢查<font color='red'> openssh, openssh-server, Sun 6 Java </font>
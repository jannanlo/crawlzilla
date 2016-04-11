# Crawlzilla 支援的作業系統 #
  * 下表為測試 Crawlzilla 安裝於其他 linux 版本的結果。


| **作業系統**             | **Master /**<br> single node<table><thead><th>  <b>Slave /</b><br> multiple node</th><th> <b>Auto solve</b><br> package dependency</th></thead><tbody>
<tr><td> Debian 5.0.x ~ 6.0.X </td><td> O                           </td><td> O                                </td><td>  O                                      </td></tr>
<tr><td> Ubuntu 8.04 ~ 10.04  </td><td> O                           </td><td> O                                </td><td>  O                                      </td></tr>
<tr><td> CentOS 5.3           </td><td> O                           </td><td> O                                </td><td>  O                                      </td></tr>
<tr><td> Fedora 12            </td><td> O                           </td><td> O                                </td><td>  O                                      </td></tr>
<tr><td> OpenSUSE 11          </td><td> O                           </td><td> O                                </td><td>  O                                      </td></tr>
<tr><td> Solaris              </td><td> -                           </td><td> -                                </td><td>  X                                      </td></tr>
<tr><td> FreeBSD              </td><td> -                           </td><td> -                                </td><td>  X                                      </td></tr>
<tr><td> Others               </td><td> -                           </td><td> -                                </td><td>  X                                      </td></tr></tbody></table>

<ul><li><b>Debian、 Ubuntu 使用 apt-get 系統 ；CentOS、 Fedora 使用 Yum 系統 ；OpenSUSE 使用 zypper 系統</b>。 Crawlzilla 會先判定使用者的作業系統是以上何者，並用相對應的套件安裝系統將基本所需的套件安裝起來。</li></ul>

<ul><li>其他 Linux 套件若要安裝 Crawlzilla ，需先手動將 <b>expect, ssh, dialog, sun-java6-jdk</b> 安裝完成後，在進行crawlzilla_install 的安裝程序。</li></ul>

<ul><li>也歡迎其他使用者給予我們您安裝其他作業系統的測試結果。
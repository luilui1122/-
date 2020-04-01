###################################################################
# File Name: disk_check.sh
# Author: linxiang
# mail: 2073874@qq.com
# Created Time: Mon 23 Mar 2020 04:54:36 PM CST
# 检查磁盘空间，如果大于80%，则报警
#=============================================================
#!/bin/bash
DF=`df | grep sd |tr -s " " ":" | cut -d: -f5|cut -d% -f1|sort -nr|head -n1`
[ "$DF" -ge 80 ] && wall diskspace is grater 80 ! || echo "diskspace is good!"

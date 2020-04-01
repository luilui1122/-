###################################################################
# File Name: backup.sh
# Author: linxiang
# mail: 2073874@qq.com
# Created Time: Mon 23 Mar 2020 11:47:58 AM CST
#=============================================================
#!/bin/bash
echo -e "\e[1;31mStart backup ....\e[0m"
sleep 2
cp -av /home/lx /home/lx_`date +%F`
echo -e "\e[1;31mBackup is finished!\e[0m"

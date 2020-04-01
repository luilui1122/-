###################################################################
# File Name: ifc_modify.sh
# Author: linxiang
# mail: 2073874@qq.com
# Created Time: Thu 26 Mar 2020 05:32:18 AM EDT
# 修改网卡的配置文件,将copy出来的掩码替换为新网卡的掩码
# 将该脚本上传到/etc/sysconfig/network-scripts/目录执行
#=============================================================
#!/bin/bash

# 拷贝eth0的配置文件为eth1
cp ifcfg-eth0 ifcfg-eth1

# 要修改的网卡配置文件ifcfg-eth1
file_name=ifcfg-eth1

# 获取新掩码
new_netmask=`ifconfig eth1 |grep -o "\<\([0-9A-Z]\{1,2\}:\)\{5\}[0-9A-Z]\{1,2\}\>"`
echo "new net mask: " $new_netmask

# 获取旧掩码
old_netmask=`cat $file_name |grep -o "\<\([0-9A-Z]\{1,2\}:\)\{5\}[0-9A-Z]\{1,2\}\>"
`
echo "old net mask: " $old_netmask

# 删除第四行UUID
sed -i '4d' $file_name
echo "del line 4!" 

# 将eth0替换为eth1
sed -i s/eth0/eth1/ $file_name
echo "replace eth0 to eth1!"

# 新掩码替换旧掩码
sed -i s/$old_netmask/$new_netmask/ $file_name
[ $? -eq 0 ] && echo "replace old netmask!" || echo "replace fail!"

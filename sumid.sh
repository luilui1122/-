###################################################################
# File Name: sumid.sh
# Author: linxiang
# mail: 2073874@qq.com
# Created Time: Mon 23 Mar 2020 03:09:00 PM CST
# 取出/etc/passwd中第x行和第n行，并将uid相加
#=============================================================
#!/bin/bash
read -p "please input line number1:" uid1
read -p "please input line number2:" uid2
# 方法1：
Id1=`cat /etc/passwd | sed -n "$uid1 p" | awk -F: '{print $3}'`
Id2=`cat /etc/passwd | sed -n "$uid2 p" | awk -F: '{print $3}'`

echo "two user's id sum=$[$Id1+$Id2]"
# 方法2：
[ $# -ne 2 ] && echo "please input 2 arg!" && exit
[[ ! "$1" =~ ^[0-9]+$ ]] && echo " $1 is not digit !" && exit
[[ ! "$2" =~ ^[0-9]+$ ]] && echo " $2 is not digit !" && exit
a=`head -n$1 /etc/passwd | tail -n1 | cut -d: -f3`
b=`head -n$2 /etc/passwd | tail -n1 | cut -d: -f3`
let c=a+b
echo $c

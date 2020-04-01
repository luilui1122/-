# 先判断输入的用户是否存在，如果存在，则退出，否则创建
#!/bin/bash

id $1 &> /dev/null
[ $? -eq 0 ] && echo "user is exit" && exit
useradd $1
echo 123 | passwd --stdin $1 &> /dev/null
echo "$1 is created"

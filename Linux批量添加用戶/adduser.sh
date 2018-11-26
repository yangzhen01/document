#!/bin/bash

FILE="/root/user.txt"

#declare -i n=0
while read line;do
   username=$(echo $line | awk -F" " '{print $1}')
   password=$(echo $line | awk -F" " '{print $2}')
   id $username > /dev/null
   if [ $? -ne 0 ];then
      useradd $username
      echo $password | passwd --stdin $username
   else
      echo "$username has existed!"
   fi
done < $FILE

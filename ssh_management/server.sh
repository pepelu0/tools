#!/bin/bash
basepath=$(cd `dirname $0`; pwd)
file=$basepath"/servers.conf"
index=1
ips=()
user_names=()
passwords=()
ports=()
printf "%-4s %-16s %-20s %-20s\n" No IP User Remark
for i in `awk '{print $1}' $file`

do
if [[ ! $i =~ ^# ]];then
  j=`awk -v I="$i" '{if(I==$1)print $2}' $file`
  k=`awk -v I="$i" '{if(I==$1)print $4}' $file`
  port=`awk -v I="$i" '{if(I==$1)print $5}' $file`
  if [ -z "$port" ]; then
    port=22
  fi
  ips[$index]=$i
  user_name[$index]=$j
  passwords[$index]=`awk -v I="$i" '{if(I==$1)print $3}' $file`
  ports[$index]=$port
  printf "%-4s %-16s %-20s %-20s\n" $index $i $j $k
  index=$[index+1]
fi
done

read s
address=${ips[$s]}
user=${user_name[$s]}
password=${passwords[$s]}
port=${ports[$s]}
expect $basepath"/logon.exp" $address $user $password $port

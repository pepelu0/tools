#!/bin/bash
basepath=$(cd `dirname $0`; pwd)
file=$basepath"/servers.conf"
index=1

printf "%-4s %-16s %-20s %-20s\n" No IP User Remark
for i in `awk '{print $1}' $file`

do
if [[ ! $i =~ ^# ]];then
  j=`awk -v I="$i" '{if(I==$1)print $2}' $file`
  k=`awk -v I="$i" '{if(I==$1)print $4}' $file`
  printf "%-4s %-16s %-20s %-20s\n" $index $i $j $k
  index=$[index+1]
fi
done

read s
address=`sed -n "$s,1p" $file | awk "{print $1}"`
user=`sed -n "$s,1p" $file | awk "{print $2}"`
password=`sed -n "$s,1p" $file | awk "{print $3}"`
expect $basepath"/logon.exp" $address $user $password

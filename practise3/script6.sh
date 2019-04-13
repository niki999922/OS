#!/bin/bash

strtempp=""

#./script5.sh
tmp=""
while read str
do
	ppid=$(echo "$str" | grep -E -h -s -i -o "Parent_ProcessID=[0-9]+" | grep -o "[0-9]\+")
	tmp=$tmp$ppid$'\n'
done < out5.txt
echo "$tmp" | uniq -c  | grep -E -o "[0-9]+" > count.txt
tmp=""
previousid=0
sum=0
cur=1
cnt=1
while read str
do
	ppid=$(echo "$str" | grep -E -h -s -i -o "Parent_ProcessID=[0-9]+" | grep -o "[0-9]\+")
	avgt=$(echo "$str" | grep -E -h -s -i -o "Average_sleeping_Time=[0-9]+" | grep -o "[0-9]\+")
	if [ "$previousid" == "$ppid" ]
	then
		let sum=$((sum+avgt))
	else
		cnt=$(head -n $cur "count.txt" | tail -n 1)
		if [ "$cnt" -eq "0" ]
		then
			cnt="1";
		fi
		let cur=$((cur + 1))
		let sum=$((sum / cnt))			
		tmp=$tmp"Average_Sleeping_Children_of_ParentID=$previousid is $sum"$'\n'
		sum=$avgt
	fi
	previousid=$ppid
	tmp=$tmp$str$'\n'
done < out5.txt
echo "$tmp" > out6.txt
cat out6.txt
rm count.txt
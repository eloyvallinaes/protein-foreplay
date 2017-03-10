#!/bin/bash

path=$( pwd )
t=0
e=0
for folder in $( ls -d */ )
do
        file=${folder%/}
        full="$folder$file.pdb"
        pro="${full%.*}_fixed.pdb"
	t=$(( t+1 ))
	if [[ ( -f "$pro" ) ]]
	then
		lines=$( wc -l $pro | egrep -o "^[0-9]{1,5}" )
		if [[ ( "$lines" != "0") ]]
		then
			echo "file $file has $lines lines"
			e=$(( e+1 ))
		fi
	fi
done

echo "GMX succeed on $e out of $t files"

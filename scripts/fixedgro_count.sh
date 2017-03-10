#!/bin/bash

path=$( pwd )
t=0
e=0
for folder in $( ls -d */ )
do
        file=${folder%/}
        full="$folder$file.pdb"
        pro="${full%.*}_fixed_processed.gro"
	t=$(( t+1 ))
	if [ -f "$pro" ]
	then
		e=$(( e+1 ))
	fi
done

echo "GMX succeed on $e fixed files out of $t files"

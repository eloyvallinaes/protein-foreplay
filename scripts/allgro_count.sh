#!/bin/bash

path=$( pwd )
t=0
e=0
for folder in $( ls -d */ )
do
        file=${folder%/}
        full="$folder$file.pdb"
	pro1="${full%.*}_processed.gro"
        pro2="${full%.*}_fixed_processed.gro"
	t=$(( t+1 ))
	if [[ ( -f "$pro1" ) || ( -f "$pro2" ) ]]
	then
		e=$(( e+1 ))
	fi
done

echo "GMX succeeded on a total of $e files out of $t files"

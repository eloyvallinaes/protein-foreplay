#!/bin/bash

module add gromacs
path=$( pwd )
e=0
for folder in $( ls -d */ )
do
	#echo $fn
	file=${folder%/}
	full="$folder$file"_fixed.pdb
	top="$folder"topol.top
	pro="${full%.*}_processed.gro"
	itp="$folder"posre.itp
        if [[ ( -f "$full" ) ]]
        then
                lines=$( wc -l $full | egrep -o "^[0-9]{1,5}" )
                if [[ ( "$lines" != "0") ]]
                then
                        e=$(( e+1 ))
			echo "reading file $e ... $full"
			#gmx pdb2gmx -ignh -f "$full" -o "$pro" -p "$top" -i "$itp" -water "spce"<<< $'15' > "gmxfixed.log" 2>&1
                fi
        fi

done

echo "$e files met the conditions (expect. 71)"

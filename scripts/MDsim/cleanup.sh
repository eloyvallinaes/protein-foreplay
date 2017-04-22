#!/bin/bash

path=$( pwd )
e=0
for folder in $( ls -d */ )
do
	file=${folder%/}
	ful="$folder$file".pdb
	fix="$folder$file"_fixed.pdb
	pro="$folder$file"_processed.gro
	fpro="$folder$file"_fixed_processed.gro

	#echo $fix
	#echo $pro
	if [[ ( -f "$fix" ) && ( -f "$fpro" )]]
	then
		mv "$fix" "$ful"
		mv "$fpro" "$pro"
		rm "$folder"#*
	fi
done

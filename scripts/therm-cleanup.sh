#!/bin/bash

path=$( pwd )
e=0
for folder in $( ls -d */ )
do
	file=${folder%/}
	ful="$folder$file".pdb

	rm "$folder"*.xvg 
	rm "$folder"*.pdf
	rm "$folder"therm.trr
	rm "$folder"therm.tpr
	rm "$folder"#*
	rm "$folder"*.log

done

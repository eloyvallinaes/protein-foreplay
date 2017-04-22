#!/bin/bash

path=$( pwd )
e=0
for folder in $( ls -d */ )
do
	file=${folder%/}
	ful="$folder$file".pdb

	mv "$folder"confout.gro "$folder"em.gro
	rm "$folder"*.tpr
	rm "$folder"*.trr
	rm "$folder"*.mdp
	rm "$folder"#*
	rm "$folder"*.log

done

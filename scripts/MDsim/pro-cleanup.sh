#!/bin/bash

path=$( pwd )
e=0
for folder in $( ls -d */ )
do
	file=${folder%/}
	ful="$folder$file".pdb

	rm "$folder"pro.trr
	rm "$folder"pro.mdp
	rm "$folder"pro.gro
	rm "$folder"pro*.cpt
	rm "$folder"pro.edr
	rm "$folder"#pro*
	rm "$folder"pro-run.log

done

#!/bin/bash

module add gromacs
path=$( pwd )
e=0
for folder in $( ls -d */ )
do
	file=${folder%/}
	pro="$folder$file"_processed.gro
	out="$folder$file"_newbox.gro
	log="$folder"box.log
	#echo $pro
	#echo $out
	gmx editconf -f "$pro" -o "$out" -c -d 1.0 -bt dodecahedron > "$log" 2>&1

done

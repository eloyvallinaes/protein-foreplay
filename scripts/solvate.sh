#!/bin/bash

module add gromacs
path=$( pwd )
e=0
for folder in $( ls -d */ )
do
	file=${folder%/}
	box="$folder$file"_newbox.gro
	sol="$folder$file"_solv.gro
	top="$folder"topol.top
	log="$folder"solv.log
	#echo $pro
	#echo $out
	#echo $top
	gmx solvate -cp "$box" -cs spc216.gro -o "$sol" -p "$top" > "$log" 2>&1

done

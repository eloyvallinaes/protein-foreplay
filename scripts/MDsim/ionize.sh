#!/bin/bash

module add gromacs
path=$( pwd )
e=0
for folder in $( ls -d */ )
do
	file=${folder%/}
	out="$folder$file"_ions.gro
	top="$folder"topol.top
	mdp="$folder"../ions.mdp
	tpr="$folder"ions.tpr
	log="$folder"genion.log
	#echo $tpr
	#echo $mdp
	#echo $top
	echo $file
	gmx genion -s "$tpr" -o "$out" -p "$top" -pname NA -nname CL -neutral <<< $'13' > "$log" 2>&1
done

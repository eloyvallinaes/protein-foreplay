#!/bin/bash

module add gromacs
path=$( pwd )
e=0
for folder in $( ls -d */ )
do
	file=${folder%/}
	sol="$folder$file"_solv.gro
	top="$folder"topol.top
	mdp="$folder"../ions.mdp
	mdout="$folder"ions-out.mdp
	tpr="$folder"ions.tpr
	log="$folder"tpr-assemb.log
	#echo $tpr
	#echo $mdp
	#echo $top
	echo $file
	gmx grompp -f "$mdp" -po "$mdout" -c "$sol" -p "$top" -o "$tpr" > "$log" 2>&1

done

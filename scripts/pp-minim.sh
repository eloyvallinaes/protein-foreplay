#!/bin/bash

module add gromacs
path=$( pwd )
e=0
for folder in $( ls -d */ )
do
	file=${folder%/}
	ion="$folder$file"_ions.gro
	top="$folder"topol.top
	mdp="$folder"../minimize.mdp
	mdout="$folder"em-out.mdp
	tpr="$folder"em.tpr
	log="$folder"em-assemb.log
	#echo $tpr
	#echo $mdp
	#echo $top
	echo $file
	gmx grompp -f "$mdp" -po "$mdout" -c "$ion" -p "$top" -o "$tpr" > "$log" 2>&1

done

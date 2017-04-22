#!/bin/bash

module add gromacs
path=$( pwd )
for folder in $( ls -d */ )
do
	#echo $fn
	file=${folder%/}
	full="$folder$file.pdb"
	top="$folder"topol.top
	pro="${full%.*}_processed.gro"
	itp="$folder"posre.itp
	gmx pdb2gmx -ignh -f "$full" -o "$pro" -p "$top" -i "$itp" -water "spce"<<< $'15'
done

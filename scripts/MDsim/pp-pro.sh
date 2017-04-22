#!/bin/bash

module add gromacs
path=$( pwd )

mdp=pro.mdp
for folder in $( ls -d */ )
do
	file=${folder%/}
	minim="$folder"pr.gro
	top="$folder"topol.top
	mdout="$folder"pro.mdp
	tpr="$folder"pro.tpr
	log="$folder"pro-assemb.log
	posre="$folder"posre.itp
	echo $file
	gmx grompp -f "$mdp" -po "$mdout" -c "$minim" -p "$top" -o "$tpr" > "$log" 2>&1

done

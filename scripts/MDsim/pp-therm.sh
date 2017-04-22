#!/bin/bash

module add gromacs
path=$( pwd )

mdp=therm.mdp
for folder in $( ls -d */ )
do
	file=${folder%/}
	minim="$folder"em.gro
	top="$folder"topol.top
	mdout="$folder"therm-out.mdp
	tpr="$folder"therm.tpr
	log="$folder"therm-assemb.log
	posre="$folder"posre.itp
	echo $file
	gmx grompp -f "$mdp" -po "$mdout" -c "$minim" -p "$top" -o "$tpr" > "$log" 2>&1

done

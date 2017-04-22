#!/bin/bash

module add gromacs
path=$( pwd )

mdp=pr.mdp
for folder in $( ls -d */ )
do
	file=${folder%/}
	minim="$folder"em.gro
	top="$folder"topol.top
	mdout="$folder"pr-out.mdp
	tpr="$folder"pr.tpr
	log="$folder"pr-assemb.log
	posre="$folder"posre.itp
	echo $file
	gmx grompp -f "$mdp" -po "$mdout" -c "$minim" -p "$top" -o "$tpr" > "$log" 2>&1

done

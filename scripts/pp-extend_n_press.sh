#!/bin/bash

module add gromacs
path=$( pwd )

mdp=press.mdp
for folder in $( ls -d */ )
do
	file=${folder%/}
	oldtpr="$folder"therm.tpr
	traj="$folder"therm.trr
	ener="$folder"therm.edr
	newtpr="$folder"extended.tpr
	log1="$folder"extension.log

	presstpr="$folder"press.tpr
	topo="$folder"topol.top
	log2="$folder"press-assemb.log
	echo $file
	#gmx convert-tpr -s $oldtpr -f $traj -e $ener -o $newtpr -extend 150 > $log1 2>&1
	gmx grompp -f $mdp -c $newtpr -o $presstpr -p $topo > $log2 2>&1
done

#!/bin/bash

path=$( pwd )
for folder in $( ls -d */ )
do
	# necessary input filenames
	oldtop="$folder"topol.top
	newtop="$folder"newtop.top
	# hot-fix script
	python ../repo/scripts/itp-topofix.py $oldtop $newtop
	mv $newtop $oldtop
done

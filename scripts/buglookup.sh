#!/bin/bash

for file in $( ls */*.pdb | grep -E "*/*-[A-Za-z0-9]{1,2}.pdb")
do
	seq=$( ../repo/scripts/stride $file | grep "ASG" | grep -vE "^ASG" | wc -l)
	if [ $seq != 0 ]
	then
		echo ${file%/*}/
	fi
done

#!/bin/bash

for item in $( ls -d 1[p-z]*/ [2,3,5]*/ 4[a-x]*/ 4y[a,l]*/ ) # 36 items
do
	sbatch sbatch_run-pro2.sh $item
done

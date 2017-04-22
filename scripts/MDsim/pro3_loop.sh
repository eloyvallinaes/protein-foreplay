#!/bin/bash

for item in $( ls -d 4yb*/ ) # 36 items
do
	sbatch sbatch_run-pro3.sh $item
done

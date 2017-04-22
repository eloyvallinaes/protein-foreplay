#!/bin/bash

for item in $( ls -d 4yb*/ ) # 36 items
do
	sbatch sbatch_run-ana3.sh $item
done

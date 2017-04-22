#!/bin/bash

for item in $( ls -d 1[a-o]*/ ) # 34 items
do
	sbatch sbatch_run-pro1.sh $item
done

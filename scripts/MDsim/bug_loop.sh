#!/bin/bash

for item in $(bash buglookup.sh)  # 34 items
do
	sbatch sbatch_run-bug.sh $item
done

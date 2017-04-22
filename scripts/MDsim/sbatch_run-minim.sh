#!/bin/bash -l
# The -l above is required to get the full environment with modules


# The name of the script is myjob
#SBATCH -J em-loop

# Select partition (aka queue)
#SBATCH -p tcb

# Only 1 hour wall-clock time will be given to this job
#SBATCH -t 24:00:00

# Number of nodes
#SBATCH --nodes=1

#SBATCH -d singleton

#SBATCH -e run-min.err
#SBATCH -o run-min.out

# load the gromacs module
module add gromacs

# run
path=$( pwd )
e=0
for folder in $( ls -d */ )
do
	file=${folder%/}
	em="$folder"em.tpr
	traj="$folder"em.trr
	out="$folder"em.gro
	energy="$folder"ener-em.edr
	log="$folder"em-run.log

	echo $file
	gmx mdrun -s "$em" -o "$traj" -c "$out" -e "$energy" -g "$log"

done

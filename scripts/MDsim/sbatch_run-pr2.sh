#!/bin/bash -l
# The -l above is required to get the full environment with modules


# The name of the script is myjob
#SBATCH -J pr-equi2

# Partition (aka queue)
#SBATCH -p tcb

# Only 24 hour wall-clock time will be given to this job
#SBATCH -t 24:00:00		#HH:MM:SS

# Number of CPUs
#SBATCH --nodes=1		# use CPU and how many

# Memory resources
# #SBATCH --mem=100 		# in MB
# #SBATCH --mem-per-cpu=100 	# in MB

# GPU resources
#SBATCH --gres=gpu:1		# use GPU and how many

#SBATCH -d singleton		# run after process with same jobname
				# and same username

#SBATCH -e pr.err
#SBATCH -o pr.out

# load the gromacs module
module add gromacs

# run
path=$( pwd )
e=0
for folder in $( ls -d [3,4,5]*/ )
do
	file=${folder%/}
	input="$folder"pr.tpr
	traj="$folder"pr.trr
	xtc="$folder"pr.xtc
	out="$folder"pr.gro
	energy="$folder"pr.edr
	log="$folder"pr-run.log
	check="$folder"pr.cpt

	echo $file
	gmx mdrun -s "$input" -o "$traj" -cpo "$check" -c "$out" -e "$energy" -g "$log"

done

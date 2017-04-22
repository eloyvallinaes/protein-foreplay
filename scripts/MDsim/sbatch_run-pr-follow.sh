#!/bin/bash -l
# The -l above is required to get the full environment with modules


# The name of the script is myjob
#SBATCH -J pr-follow

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

#SBATCH -e pr-followb.err
#SBATCH -o pr-followb.out

# load the gromacs module
module add gromacs

# run
path=$( pwd )
e=0
	folder="1dpe-A/"
	file=${folder%/}
	input="$folder"pr2.tpr
	traj="$folder"pr2.trr
	xtc="$folder"pr2.xtc
	out="$folder"pr2.gro
	energy="$folder"pr2.edr
	log="$folder"pr2-run.log
	check="$folder"pr2.cpt

	echo $file
	gmx mdrun -s "$input" -o "$traj" -cpo "$check" -c "$out" -e "$energy" -g "$log"

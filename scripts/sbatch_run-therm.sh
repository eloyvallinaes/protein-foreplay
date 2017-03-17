#!/bin/bash -l
# The -l above is required to get the full environment with modules


# The name of the script is myjob
#SBATCH -J therm-loop

# Partition (aka queue)
#SBATCH -p tcb

# Only 24 hour wall-clock time will be given to this job
#SBATCH -t 24:00:00		#HH:MM:SS

# Number of CPUs
# #SBATCH --nodes=1		# use CPU and how many

# Memory resources
# #SBATCH --mem=100 		# in MB
# #SBATCH --mem-per-cpu=100 	# in MB

# GPU resources
#SBATCH --gres=gpu:1		# use GPU and how many

#SBATCH -d singleton		# run after process with same jobname
				# and same username

#SBATCH -e therm.err
#SBATCH -o therm.out

# load the gromacs module
module add gromacs

# run
path=$( pwd )
e=0
for folder in $( ls -d */ )
do
	file=${folder%/}
	em="$folder"therm.tpr
	traj="$folder"therm.trr
	out="$folder"therm.gro
	energy="$folder"therm.edr
	log="$folder"therm-run.log
	check="$folder"thermstate.cpt

	echo $file
	gmx mdrun -s "$em" -o "$traj" -cpo "$check" -c "$out" -e "$energy" -g "$log"

done

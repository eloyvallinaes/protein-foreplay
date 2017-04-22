#!/bin/bash -l
# The -l above is required to get the full environment with modules


# The name of the script is myjob
#SBATCH -J pro1

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

#SBATCH -e pro1.err
#SBATCH -o pro1.out

# load the gromacs module
module add gromacs

# run
folder=$1
file=${folder%/}
input="$folder"pro.tpr
traj="$folder"pro.trr
xtc="$folder"pro.xtc
out="$folder"pro.gro
energy="$folder"pro.edr
log="$folder"pro-run.log
check="$folder"pro.cpt

echo $file
gmx mdrun -s "$input" -o "$traj" -x "$xtc" -cpo "$check" -c "$out" -e "$energy" -g "$log"


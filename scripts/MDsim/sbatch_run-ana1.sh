#!/bin/bash -l
# The -l above is required to get the full environment with modules


# The name of the script is myjob
#SBATCH -J ana1

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
# SBATCH --gres=gpu:1		# use GPU and how many

#SBATCH -d singleton		# run after process with same jobname
				# and same username

#SBATCH -e ana1.err
#SBATCH -o ana1.out

# load the gromacs module
module add gromacs

echo $1
folder=$1
	name=${folder%/}
	analout="$folder""$name"_trajdata.txt
	rm $analout
	orgxtc="$folder"pro.xtc
	tpr="$folder"pro.tpr
	convout="$folder"pro-xtc.pdb
	log="$folder"ana.log
	gmx trjconv -f $orgxtc -s $tpr -o $convout -ur compact -sep <<<$'1' >> $log 2>&1

	for snap in $( ls "$folder"pro-xtc*)
	do
	strout=${snap%.pdb}.stride
	./stride $snap > $strout
	done

	for snap in $( ls "$folder"pro-xtc*.pdb )
	do
	python traj_analyze.py $snap >> $analout
	done
rm "$folder"pro-xtc*.pdb
rm "$folder"pro-xtc*.stride

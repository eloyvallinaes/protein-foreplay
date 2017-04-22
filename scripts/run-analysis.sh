module add gromacs

echo $1
folder=$1
	name=${folder%/}
	analout="$folder""$name"_trajdata.txt
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

	#bash "$folder"ordertraj9.sh	#renaming
	#bash "$folder"ordertraj99.sh
	#bash "$folder"ordertraj999.sh
	#bash "$folder"ordertraj9999.sh

	for snap in $( ls "$folder"pro-xtc*.pdb )
	do
	python traj_analyze.py $snap >> $analout
	done
rm "$folder"pro-xtc*.pdb
rm "$folder"pro-xtc*.stride

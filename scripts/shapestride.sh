#!/bin/bash
# Input args in format 1spd-A.pdb
python chopit.py $1

../repo/scripts/stride $1 > ${1%.pdb}_00000.stride

awk -F" A " '{print $1" "$2}' $1 > t1

cp header t2

cat t1 >> t2

mv t2 ${1%.pdb}_00000.pdb

rm t1

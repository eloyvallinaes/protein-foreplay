#!/bin/bash

path=$( pwd )
for file in $( ls "$path"/*-*.pdb | grep -v "bundle" )
do
	dir="${file##*/}"
	newdir="${dir%.*}"
	echo "$newdir"
	mkdir "$newdir"
	mv $file "$newdir"
done

rm *pdb

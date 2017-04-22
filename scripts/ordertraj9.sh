#!/bin/bash
folder=$1
a=0
for i in $(ls "$folder"*.pdb | egrep "pro-xtc.\.pdb") ; do
  new=$(printf "pro-xtc%05d.pdb" "$a") #05 pad to length of 5
  mv $i "$new"
  let a=a+1
done

b=0
for i in $(ls "$folder"*.stride | egrep "pro-xtc.\.stride"); do
  new=$(printf "pro-xtc%05d.stride" "$b")
  mv $i "$new"
  let b=b+1
done

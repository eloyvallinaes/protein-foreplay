#!/usr/bin/python

import chaintools as ct

f=open("PDB114set.csv", 'r').readlines()[1:]

for line in f:
	line=line.split("\t")
	filename=line[15][:4].lower()+".pdb"
	chain=line[16]
	if filename in ["4ybb.pdb","4v8i.pdb","4v89.pdb"]: # bundles
		[newfile, newchain]=ct.bundlemap(filename, chain)
		print newfile, newchain

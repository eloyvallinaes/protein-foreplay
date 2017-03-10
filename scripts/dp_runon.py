#!/usr/bin/python

import chaintools as ct

f=open("PDB114set.csv", 'r').readlines()[1:]

dpm=[]
for line in f:
	line=line.split("\t")
	filename=line[15][:4].lower()+".pdb"
	chain=line[16]
	print filename, chain
	if filename in ["4ybb.pdb","4v8i.pdb","4v89.pdb"]: # bundles
		[newfile, newchain]=ct.bundlemap(filename, chain)
		filename=newfile
		chain=newchain
	dpm.append(ct.dipole(filename, chain))

g=open("dipoleresults.txt", 'w')
g.write("%-25s\t%10s\t%10s\t%10s\t%10s\t%10s\n"%("File", "Chain", "Missing", "NetCharge", "Mass", "DPM"))
for item in dpm:
	g.write("%-25s %10s %10s %10.1f %10.1f %10.1f\n"%(item[0], item[1], item[2], item[3], item[4], item[5]))


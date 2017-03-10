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
		[file, fchain, rows]=ct.isolatechain(newfile, newchain)
	else:
		[file, fchain, rows]=ct.isolatechain(filename, chain)
	g=open(filename[:-4]+"-"+chain+".pdb", 'w')
	for row in rows:
		g.write(row)
	g.close()

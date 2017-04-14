#!/usr/bin/python

# traj_analyze.py output averaging for all proteins in set
# bash input feed --> folder name
# output to file
# no headers
# combine with SCL info
# further process in matlab

import sys
import numpy as np
import re
import pdb
folder=sys.argv[1]
path=folder+folder[:-1]+"_trajdata.txt"
gro=folder+"pro.gro"

f=open(path, 'r').readlines()
g=open('PDB114set.csv', 'r').readlines()[1:]
h=open(gro, 'r').readlines()[2:]
halfa=[line for line in h if line.split()[1] == "CA"]
for line in g:
	l=line.split("\t")
	if l[15][:4].lower()+'-'+l[16] == folder[:-1]:
		scl=int(l[9])	#ExpSCL
		mw=int(l[4])	#MW

# Hydrophobic residues
fatty=["ALA", "VAL", "ILE", "LEU", "MET", "PHE", "TYR", "TRP"]
TFR=0	# total fatty residues
for line in halfa:
	resid=line.split()[0][-3:]
	if resid in fatty:
		TFR=TFR+1


# format: t chrgdens (dx,dy,dz) dm (q1,q2,q3) guy guydens NFE NExp SASA
data=np.array([0, 0, 0, 0, 0, 0, 0, 0])
c=0
for line in f:
	c=c+1
	l=[float(item) for item in re.split(r'[\s \, \( \)]',line) if item]
	data=data+np.array([l[1], l[5], l[6], l[9], l[10], l[11], l[12], l[13]])

av=data/c	# conformations?
layout=('{0:>6s} {1[0]:> .4E} {1[1]:> .4E} {1[2]:> .4E} '
	'{1[3]:> .4E} {1[4]:> .4E} '
	'{1[5]:> .4E} {1[6]:> .4E} {1[7]:> .4E} {2:>6d} {3:>3d} {4:>1d}')

print layout.format(folder[:-1], av, mw, TFR, scl)



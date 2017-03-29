#!/usr/bin/python
import re
import sys
from protein import Atom
from protein import Residue
from protein import Snap
import numpy as np
import math

f=open(sys.argv[1], 'r').readlines()
snap_name=sys.argv[1][:-4]
snap_time=float(f[1].split()[-1])		# TITLE line

atom_lines=[line for line in f if re.match(r"^ATOM  ", line)]
atomlist=[Atom(line) for line in atom_lines]

prev_resnum=''
reslist=[]
for atom in atomlist:
    resnum=atom.resnum
    if resnum != prev_resnum:
        reslist.append(Residue(atom.resname, [atom]))
        prev_resnum=resnum
    else:
        reslist[-1].add_atom(atom)

for res in reslist:
	res.CentreOfMass()

A=Snap(snap_name, snap_time, reslist)

print A.time, A.dipolemod


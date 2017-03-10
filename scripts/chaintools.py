#!/usr/bin/python

import pdb
import re
import os
import numpy as np
import math
def nmrchains(filename,listedfile,chain):
	f=[line for line in listedfile if re.search(r'^TER|^ATOM|^MODEL|^ENDMDL', line)]
        aswitch=0
	chainF=[]
	out=[]
        for line in f:
                if "MODEL" in line:
                        chainF.append(line)
                elif "ATOM" in line and line.split()[4] == chain:
                        chainF.append(line)
                        aswitch=1
                elif "TER" in line and line.split()[3] == chain:
                        chainF.append(line)
                elif "ENDMDL" in line:
                        chainF.append(line)
                        if aswitch == 1:
                                out=out+chainF
				chainF=[]
				aswitch=0
				continue
			else:
                                chainF=[]
				aswitch=0
                                continue
	return filename, chain, out
if __name__ == '__main__':
	nmrchains()

def isolatechain(filename, chain):
	"Extracts the ATOM lines of a chain found in a PDB file"
	f=open(filename, 'r').readlines()
	method=[line for line in f if "EXPDTA" in line][0].strip()
	if 'NMR' in method:
		[file,chain,chainF]=nmrchains(filename,f,chain)
	else:
		f=[line for line in f if re.search(r'^ATOM', line)]
		chainF=[line for line in f if line.split()[4] == chain]
	return filename, chain, chainF
if __name__ == '__main__':
	isolatechain()

def dipole(file, chain):
	"Calculates the dipole moment of a chain in a PDB file."
	# Antosiewicz J (1995) "Computation of the dipole moments of proteins"
	# Assume m_neutral is small
	# Calculate m_charges
	f=open(file, 'r').readlines()

	f=[line for line in f if re.search("^ATOM", line)]
	chainF=[line for line in f if line.split()[4] is chain]

	R=np.array([0,0,0])
	pos=[]
	neg=[]
	M=[]
	weights=dict([("ALA", 89.1), ("ARG", 174.2), ("ASN", 132.1),
			("ASP", 133.1), ("CYS", 121.2), ("GLU", 147.1),
			("GLN", 146.2), ("GLY", 75.10), ("HIS", 155.2),
			("ILE", 131.2), ("LEU", 131.2), ("LYS", 146.2),
			("MET", 149.2), ("PHE", 165.2), ("PRO", 115.1),
			("SER", 105.1), ("THR", 119.1), ("TRP", 204.2),
			("TYR", 181.2), ("VAL", 117.1), ("UNK", 110.0)])
	rn=int(chainF[0].split()[5])
	missingres=0
	while rn in range(rn-1,1+int(chainF[-1].split()[5])):
		residue=[line for line in chainF if int(re.sub(r'[A-Z]', "", line.split()[5])) == rn]
		if not residue:
			missingres+=1
			rn+=1
			continue
		rn=rn+1
		if "GLY" in residue[0]:
			CA=[i for i, item in enumerate(residue) if "CA" in residue[i]]
			CA=CA[0]
			m=weights["GLY"]
			v=re.findall(r"[-]{0,1}[1-9]{0,1}[0-9]{1,2}\.[0-9]{3}", residue[CA])[:3]
			vn=[float(i) for i in v]
			p=np.array(vn)
			R=R+p*m
			M.append(m)
		else:
			CB=[i for i, item in enumerate(residue) if "CB" in item]
			if not CB:	# take CA as if CB when CB is not in the structure
				CB=[i for i, item in enumerate(residue) if "CA" in item]
			if not CB:
				CB=[i for i, item in enumerate(residue) if "N" in item]
			CB=CB[0]
			m=weights[residue[0].split()[3][-3:]]
			v=re.findall(r"[-]{0,1}[1-9]{0,1}[0-9]{1,2}\.[0-9]{3}", residue[CB])[:3]
			vn=[float(i) for i in v]
			p=np.array(vn)
			R=R+p*m
			M.append(m)
			resID=residue[0].split()[3]
			if resID == "LYS" or resID == "ARG":
				pos.append(p)
			elif resID == "ASP" or resID == "GLU":
				neg.append(p)
	COM=R/sum(M)
	DP=np.array([0, 0, 0])
	netcharge=len(pos)-len(neg)
	for vector in pos:
		DP=DP+(vector-COM)
	for vector in neg:
		DP=DP-(vector-COM)

	DPM=math.sqrt(np.sum(np.multiply(DP,DP)))
	DPM=DPM*1.602e-19*1e-10/3.34e-30
	return file, chain, str(missingres)+"/"+str(rn), netcharge, sum(M), np.round(DPM);
if __name__ == '__main__':
    dipole()

def bundlemap(file, chain):
	"Maps chain identifier to its corresponding chain in the bundle"
	# Depends on ####-chain-id-mapping.txt
	ii=[]
	map=open(file[:4]+"-chain-id-mapping.txt", 'r').readlines()
        for index, line in enumerate(map):
       		if "bundle" in line:
                	ii.append(index)
                elif chain in line:
                        ci=index
                      	newchain=line.split()[0]
	if ci > ii[-1]:
		newfile=map[ii[-1]].strip().strip(":")
	elif ci < ii[1]:
		newfile=map[ii[0]].strip().strip(":")
	else:
		newfile=map[max([x for x in ii if x < ci])].strip().strip(":")

	return newfile, newchain
if __name__ == '__main__':
	bundlemap()


def length(filename, chain=""):
	f=open(filename, 'r').readlines()
	atoms=[line for line in f if re.search("^ATOM", line)]
	CA=[line for line in atoms if " CA " in line]
	if chain:	# file might contain more than one chain
		CA=[line for line in CA if line.split()[4] == chain]
	resnum=[line.split()[5] for line in CA]
	resnum=[int(''.join(re.findall(r'[0-9]+',item))) for item in resnum]
	return min(resnum), max(resnum), len(set(resnum))

if __name__ == '__main__':
	length()

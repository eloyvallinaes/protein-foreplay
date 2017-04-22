#!/usr/bin/python

import numpy as np
import math
import re
# Residues weigths
weights=dict([("ALA", 89.1), ("ARG", 174.2), ("ASN", 132.1),
              ("ASP", 133.1), ("CYS", 121.2), ("GLU", 147.1),
              ("GLN", 146.2), ("GLY", 75.10), ("HIS", 155.2),
              ("ILE", 131.2), ("LEU", 131.2), ("LYS", 146.2),
              ("MET", 149.2), ("PHE", 165.2), ("PRO", 115.1),
              ("SER", 105.1), ("THR", 119.1), ("TRP", 204.2),
              ("TYR", 181.2), ("VAL", 117.1), ("UNK", 110.0)])
# Grouped residues
charged=["ARG", "ASP", "LYS", "GLU"]
fatty=["ALA", "VAL", "ILE", "LEU", "MET", "PHE", "TYR", "TRP"]

# Atoms masses
masses=dict([("C", 12.0), ("O", 16.0), ("H", 1.0),
			 ("N", 14.0), ("S", 32.0)])

# Mean maximum residue surface area in Gly-X-Gly peptides
#		-> Bendell 2014 et al. Supp. file 3
MMRSA=dict([("GLY", 47.155), ("ALA", 61.063), ("SER", 69.073),
			("CYS", 78.620), ("PRO", 81.030), ("THR", 82.920),
			("ASP", 86.142), ("VAL", 90.264), ("ASN", 90.541),
			("GLU", 102.570), ("ILE", 105.307), ("LEU", 105.842),
			("GLN", 106.534), ("HIS", 110.864), ("MET", 112.010),
			("LYS", 120.502), ("PHE", 124.714), ("TYR", 130.885),
			("ARG", 138.595), ("TRP", 148.915)])
# Guy solvation energies (Fi) from TABLE IV (mean)
Guy=dict([("ILE", -1.31), ("LEU", -1.21), ("VAL", -1.09), ("ALA", 0.06),
		  ("GLY", 0.41), ("PRO", 0.70), ("PHE", -1.68), ("MET", -1.27),
		  ("TRP", -0.88), ("TYR", -0.33), ("HIS", -0.49), ("THR", 0.27),
		  ("SER", 0.50), ("ASN", 0.48), ("GLN", 0.73), ("ASP", 0.80),
		  ("GLU", 0.77), ("LYS", 1.18), ("ARG", 0.84), ("CYS", -1.36)])
class Snap:
	def __init__(self, name, time, reslist):
		self.name=name
		self.time=time
		self.reslist=reslist

		self.COM=self.CentreOfMass()
		self.length=self.getlength()
		self.MW=self.getMW()

		self.netcharge=self.getnetcharge()
		self.dipole=self.getdipole()
		self.dipolemod=self.getdipolemod()
		self.quad=self.getquad()	# the eigenvalues of Q matrix

		self.getrSASA()		# get relative SASA for residues
		self.nexp=self.expcount()	# save res.exposed and count
		self.tSASA=self.get_tSASA()	# sum tSASA of all residues
		self.nfatty_exp=self.expfattycount() # count fatty & exposed
		self.fatdens=self.nfatty_exp/self.tSASA	# fatty&expos/tSASA

		self.guy=self.getGuy()	# sum Guy solv_ener of exposed res
		self.guydens=self.guy/self.tSASA

	def getlength(self):
		return len(self.reslist)

	def getMW(self):
		return sum(res.weight for res in self.reslist)

	def getnetcharge(self):
		pos=0.0
		neg=0.0
		for res in self.reslist:
			if res.charge == 1.0:
				pos=pos+1
			elif res.charge == -1.0:
				neg=neg+1
			else:
				continue
		return pos-neg

	def expfattycount(self):
		c=0
		for res in self.reslist:
			if res.fatty and res.exposed:
				c=c+1
		return c

	def getdipole(self):
		DP=np.array([0.0, 0.0, 0.0])
		for res in self.reslist:
			if res.charge == 1.0:
				DP=DP+(res.COM-self.COM)
			elif res.charge == -1.0:
				DP=DP-(res.COM-self.COM)
			else:
				continue
		return DP

	def getdipolemod(self):
		DP=self.dipole
		DPM=math.sqrt(np.sum(np.multiply(DP,DP)))
		return DPM*1.60e-19*1e-10/3.34e-30

	def CentreOfMass(self):
		COM=np.array([0.0,0.0,0.0])
		M=0.0
		for res in self.reslist:
			M=M+res.weight
			mass_vector=res.COM*res.weight
			COM=COM+mass_vector
		COM=COM/M
		return COM

	def getrSASA(self):
		f=open(self.name+'.stride', 'r').readlines()
		asg=[line for line in f if re.match('^ASG',line)]
		for line, res in zip(asg, self.reslist):
			l=line.split()
			res.sasa=float(l[-2])
			res.rsasa=res.sasa/res.mmrsa

	def expcount(self):
		c=0
		for res in self.reslist:
			if res.rsasa > 0.10:
				res.exposed=True		# arbitrary threshold
				c=c+1
			else:
				res.exposed=False
		return c

	def get_tSASA(self):
		S=0.0
		for res in self.reslist:
			S=S+res.sasa
		return S

	def getGuy(self):
		exp_guy=sum([res.guy for res in self.reslist if res.exposed])
		return exp_guy

	def getquad(self):
		Qxx=0
		Qxy=0
		Qxz=0
		Qyy=0
		Qyz=0
		Qyx=0
		Qzz=0
		Qzx=0
		Qzy=0
		for res in self.reslist:
			if res.name in charged:
				rx=res.COM[0]
				ry=res.COM[1]
				rz=res.COM[2]
				m=np.linalg.norm(res.COM)
				Qxx=Qxx+(3*rx*rx-m)*res.charge
				Qxy=Qxy+(3*rx*ry)*res.charge
				Qxz=Qxz+(3*rx*rz)*res.charge

				Qyy=Qyy+(3*ry*ry-m)*res.charge
				Qyx=Qyx+(3*ry*rx)*res.charge
				Qyz=Qyz+(3*ry*rz)*res.charge

				Qzz=Qzz+(3*rz*rz-m)*res.charge
				Qzx=Qzx+(3*rz*rx)*res.charge
				Qzy=Qzy+(3*rz*ry)*res.charge

		QM=np.array([[Qxx, Qxy, Qxz],[Qyx, Qyy, Qyz], [Qzx, Qzy, Qzz]])
		w,v=np.linalg.eig(QM)
		return w

class Residue:
	def __init__(self, name, atomlist=[]):
		self.name=name
		self.atomlist=atomlist	# empty by default or open with a list
								# of atom_objects
		self.charge=self.getcharge()
		self.COM=np.array([0.0, 0.0, 0.0])
		self.weight=weights[name]
		self.num=self.getnum()

		self.mmrsa=MMRSA[self.name]
		self.sasa=0.0
		self.rsasa=0.0
		self.exposed=False

		self.fatty=self.isfatty()
		self.guy=Guy[self.name]

	def getnum(self):
		if len(set([atom.resnum for atom in self.atomlist])) == 1:
			return self.atomlist[0].resnum
		else:
			raise RuntimeError('Hybrid residue')

	def getcharge(self):
		if self.name in ["LYS", "ARG"]:
			return 1.0
		elif self.name in ["ASP", "GLU"]:
			return -1.0
		else:
			return 0.0

	def CentreOfMass(self):
		COM=np.array([0.0,0.0,0.0])
		M=0.0
		for atom in self.atomlist:
			M=M+atom.mass
			mass_vector=atom.coord*atom.mass
			COM=COM+mass_vector
		COM=COM/M
		self.COM=COM

	def add_atom(self,atom_object):
		self.atomlist.append(atom_object)

	def isfatty(self):
		if self.name in fatty:
			return True
		else:
			return False

class Atom:
	def __init__(self, atomline):
		self.atomline=atomline
		self.name=self.getname()
		self.coord=self.getcoord()
		self.mass=masses[self.name]
		self.resnum=self.getresnum()
		self.resname=self.getresname()
		self.heavy=self.isheavy()
		self.backbone=self.isbackbone()

	def getname(self):
		return self.atomline.split()[-1]

	def getcoord(self):
		v=re.findall(r"[-]{0,1}[1-9]{0,1}[0-9]{1,2}\.[0-9]{3}",
					self.atomline)[:3]
		return np.array([float(i) for i in v])

	def getresnum(self):
		return self.atomline.split()[4]

	def getresname(self):
		return re.findall(r"[A-Z]{3} ", self.atomline[4:])[0].strip()

	def isheavy(self):
		if self.name == 'H':
			return False
		else:
			return True

	def isbackbone(self):
		atomid=self.atomline.split()[2]
		if atomid in ['C', 'CA', 'H', 'HA', 'HA1', 'HA2', 'N', 'O']:
			return True
		else:
			return False

#!/usr/bin/python

# Extract numbers and plot data in xvg files produced by gromacs

import sys
import matplotlib.pyplot as plt
import re
import argparse

parser = argparse.ArgumentParser(description='Get data in xvg file produced by gromacs and plot it')
parser.add_argument("xvg-file",
	help="file containing the data in xvg format", type=str)
parser.add_argument('--average', help="include the running average",
	nargs='?', type=int, default=-1, const=50)
parser.add_argument('--save', help="supress showing and save to PDF",
	type=str)
parser.add_argument('--noshow', help="supress graphical output",
	action='store_true')

args=parser.parse_args()

f=open(sys.argv[1], 'r').readlines()
data=[line for line in f if "#" not in line and "@" not in line]
comments=[line for line in f if "@" in line]

xlabel=[line for line in comments if "xaxis" in line]
xlabel=xlabel[0].split(" label ")[1].strip().replace('"', '')

ylabel=[line for line in comments if "yaxis" in line]
ylabel=ylabel[0].split(" label ")[1].strip().replace('"', '')

x=[]
y=[]
for line in data:
	l=line.split()
	x.append(float(l[0]))
	y.append(float(l[1]))

fig=plt.figure()
plt.plot(x,y, '-k')
plt.xlabel(xlabel)
plt.ylabel(ylabel)

if args.average != -1:
	sumY=0
	count=0
	running_av=[]
	for item in y[args.average:]:
		sumY=sumY+item
		count=count+1
		running_av.append(sumY/count)
	print running_av[-1]
	plt.plot(x[args.average:],running_av, '-r')

if args.save:
	fname=args.save.replace('.pdf', '')
	fig.savefig(fname+'.pdf', bbox_inches='tight')
elif not args.noshow:
	plt.show()

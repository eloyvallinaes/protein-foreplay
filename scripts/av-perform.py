#!/usr/bin/python

# Calculate perfomace of a filtered file
import sys

f=open(sys.argv[1], 'r').readlines()

sum=0
c=0
for line in f:
	l=line.split()
	sum=sum+float(l[1])
	c=c+1
print "Finished runs: ", c
print "Av. performance: ", sum/c, " ns/day"
print "This means 10 ns take ~", 10/(sum/c)*24, "h"
print "and 1 ns takes ~", 1/(sum/c)*24*60, "min"

#!/usr/bin/python

import chaintools as ct
import sys
import re
f=sys.argv[1:]

dpm=[]
for input in f:
	chain=re.sub('[a-z0-9]{4}-','', input[:-4])
	readfile=re.sub('-[a-zA-Z]{1}', '', input)

	data=open(readfile, 'r').readlines()
	expdata=[line for line in data if re.match('^EXPDTA', line)]
	if "NMR" in expdata[0]:
		[filename, chain, out]=ct.nmrchains(readfile, data, chain, 1)
	else:
		[filename, chain, out]=ct.isolatechain(readfile, chain)
	g=open(input, 'w')
	for row in out:
		g.write(row)
	g.close()

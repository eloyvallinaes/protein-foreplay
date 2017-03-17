#!/usr/bin/python

# Fix wrong pathing of itp file in topology

import sys
import re

old=open(sys.argv[1], 'r').readlines()
new=open(sys.argv[2], 'w')

for line in old:
	if re.match(r'#include "[a-z0-9]{4}-[A-Z0-9]{1,2}/posre\.itp', line):
		new.write('#include "posre.itp"\n')
	else:
		new.write(line)
new.close()

#!/usr/bin/python

import chaintools as ct
import os

folders=[item for item in os.listdir(".") if os.path.isdir(item)]
for folder in folders:
	filepath=folder+"/"+folder+".pdb"
	[mini, maxi, tot]=ct.length(filepath)
	print folder, mini, str(maxi), str(tot)

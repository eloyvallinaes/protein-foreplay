#!/usr/bin/python

# Loop through directories (looking for files in which gmx failed)
# Find pdb files and submit them to online fixing tool
# Tool: http://lorentz.dynstr.pasteur.fr/pdb/frozen_submission.php
# Run from directory containing structures in folders of the same name
# eg gmxrun/ when ls gmxrun outputs: 1a69-A 1ade-A 1ah9-A...
import os
import re
import filetools as ft
import pdb
submissions=open("submitted.txt", 'w')
for folder in [i for i in os.listdir(".") if os.path.isdir(i)]:
	folder_list=os.listdir("./"+folder)
	filepath="./"+folder+"/"+folder+".pdb"
	regexp=re.compile('[a-z0-9]{4}-[A-Z0-9]{1,2}_processed\.gro')
	if not any(regexp.match(item) for item in folder_list):
		job=ft.pdbfixsubmit(filepath)
		submissions.write(folder+"\t"+job+"\n")
		[std, pdb]=ft.pdbfixretrieve(job)
		with open("./"+folder+"/"+folder+"_fixed.pdb", 'w') as fpdb:
			fpdb.write(pdb)
		with open("./"+folder+"/fix.log", 'w') as fstd:
			fstd.write(std)
submissions.close()


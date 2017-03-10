#!/usr/bin/python

import re
import os
from robobrowser import RoboBrowser
import time
import pdb
# Column numbers in f2col, f1omit and f2omit start counting from 0
# f1omit=f2omit=1 in order to remove typical headers
def addcol(f1, f2, f2col, f1omit=1, f2omit=1):
	"Adds a column from one tsv file to another"
	reciev=open(f1, 'r').readlines()[f1omit:]
	source=open(f2, 'r').readlines()[f2omit:]
	if len(reciev) != len(source):
		print("Files have different number of rows!")
	new=open(f1.split(".")[0]+"_added."+f1.split(".")[1], 'w')
	
	reciev=[line.strip() for line in reciev]
	source_field=[line.strip().split("\t")[f2col] for line in source]
	
	for i in range(0,len(reciev)):
		new.write(reciev[i]+"\t"+source_field[i]+"\n")
	new.close()

# Script submits PDB file with missing atoms and/or residues to online
# tool: http://lorentz.dynstr.pasteur.fr/pdb/frozen_submission.php
def pdbfixsubmit(pdbfile):
	"Submit structure to pdb_fix online tool"
	url='http://lorentz.dynstr.pasteur.fr/pdb/frozen_submission.php'
	browser=RoboBrowser(history=True)
	browser.open(url)
	upload_form=browser.get_form()
	upload_form['job_name'].value = pdbfile.split("/")[0]+'_atomfix'
	upload_form['inpdb'].value = open(pdbfile, 'r')
	browser.submit_form(upload_form)
	print 'submitted ', pdbfile.split("/")[0]
	joblink=browser.get_links('jobs')
	return joblink[0]['href']

def pdbfixretrieve(joblink):
	browser=RoboBrowser(history=True)
	browser.open(joblink)
	stdout=browser.get_links('stdout')
	while not stdout:
		time.sleep(5)
		browser.open(joblink)
		stdout=browser.get_links('stdout')
	pdbout=browser.get_links('outpdb')
	browser.follow_link(stdout[0])
	stdcontent=browser.response.content
	browser.follow_link(pdbout[0])
	pdbcontent=browser.response.content
	pdb.set_trace()
	return stdcontent, pdbcontent

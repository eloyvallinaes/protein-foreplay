#!/usr/bin/python

import re
from bs4 import BeautifulSoup
from robobrowser import RoboBrowser

browser=RoboBrowser(history=True)
f=open('PDB114set.csv', 'r').readlines()[1:]

ids=[(line.split("\t")[15][:4].lower(), line.split("\t")[16]) for line in f]
out=open('pdbcoverages.txt', 'w')
for id in ids:
	print id
	url='https://www.ebi.ac.uk/pdbe/entry/pdb/'+id[0]
	browser.open(url)
	content=browser.response.content
	soup=BeautifulSoup(content)
	txt=soup.get_text().split("\n\n")
	regexp=r'Chain[s]{0,1}: '+re.escape(id[1])+r'[,]{0,1}[A-Za-z]{0,1}[,]{0,1}'
	chain=[i for i, item in enumerate(txt) if re.search(regexp, item)]
	part=''.join(txt[chain[0]:chain[0]+10])
	cov=re.findall(r'Coverage: [0-9]{1,}%', part)
	res=re.findall(r'Residues: [0-9]{1,}-[0-9]{1,}', part)
	if not cov or not res:
		cov=['Coverage: 0%']
		res=['Residues: 0-0']
	spelling=(id[0], id[1], str(res[0]).split(":")[0], str(res[0]).split(":")[1], str(cov[0]).split(":")[0], str(cov[0]).split(":")[1])
	out.write('%4s %2s %9s %9s %9s %4s\n'%spelling)



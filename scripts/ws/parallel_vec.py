outermost_list=[]
for res in A.reslist:
	dist_max=0.0
	outermost=''
	c=res.COM
	for atom  in res.atomlist:
		if atom.isheavy() and not atom.backbone:
			d=math.sqrt(sum(np.power(atom.coord-res.COM, 2)))
			if d > dist_max:
				dist_max=d
				outermost=atom
			else:
				continue
		else:
			continue
	outermost_list.append((res,outermost))

for res, atom in outermost_list:
	R=res.COM-A.COM
	r=atom.coord-res.COM
	dotp=np.dot(R,r)
	if dotp > 0:
		exposed=1
	else:
		exposed=0
	print res.num, res.name, atom.name, exposed

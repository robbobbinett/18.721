from os import getcwd
artindir = getcwd()

with open('temp.tex', 'r') as f:
	temp = f.read()

temp2 = temp.replace(artindir, '/afs/athena.mit.edu/user/r/r/rrobinet/Documents/Github/18.721')

with open('temp2.tex', 'w') as f:
	f.write(temp2)

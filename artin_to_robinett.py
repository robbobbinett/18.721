import os
artindir = os.getcwd()

with open('filename.txt', 'r') as f:
	filename = f.read()
	if filename == '\n':
		raise ValueError('Please specify a .tex file (e.g. filename.tex)')
	filename = filename.replace('\n', '')
os.remove('filename.txt')

with open(filename, 'r') as f:
	temp = f.read()

temp2 = temp.replace(artindir, '/afs/athena.mit.edu/user/r/r/rrobinet/Documents/Github/18.721')

with open('temp2.tex', 'w') as f:
	f.write(temp2)

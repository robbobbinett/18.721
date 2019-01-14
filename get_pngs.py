import os
rootdir = os.getcwd()

verboten = ['Ellipse', 'Plot ge']

image_names = []
for root, _, files in os.walk(rootdir+'/images'):
	for file in files:
		if file[::-1][0:3][::-1] == 'pdf' and file[0:7] not in verboten:
			image_names.append(root+'/'+file[:-4])

from subprocess import call
call('pdfinfo > read_del.txt', shell=True)
with open('read_del.txt', 'r') as f:
	pdfinfo = f.read()
os.remove('read_del.txt')

from math import floor
image_size = []
bash_template = "pdfinfo REPLACE.pdf > read_del.txt"
for name in image_names:
	bash_command = bash_template.replace('REPLACE', name)
	call(bash_command, shell=True)
	with open("read_del.txt", 'r') as f:
		text = f.read()
		text_cut = text[text.find("Page size:"):text.find("\nFile")]
		text_cut = text_cut.replace(' ', '')
		text_cut = text_cut.replace('\nPagerot:0', '')
		text_cut = text_cut.replace('Pagesize:', '')
		text_cut = text_cut.replace('pts', '')
		text_cut = text_cut.replace('(letter)', '')
		if not '\n' in text_cut:
			cut = text_cut.split('x')
			if cut != ['']:
				image_size.append((name, [str(int(float(num))) for num in cut]))
	os.remove('read_del.txt')

figtext1 = '\\begin{figure}[H]\n\\centering\n\\begin{examples}{}\n\\label{goober'
figtext2 = '}\n\\Marginnote{goober'
figtext3 = '}\n\\end{examples}\n\\includegraphics[width=5.0cm, natwidth='
figtext4 = 'mm, natheight='
figtext5 = 'mm]{'
figtext6 = '.pdf} \\\\\nThis is a nice caption.\n\\end{figure}\n\n'

with open('temp.tex', 'a') as f:
	for j, image in enumerate(image_size):
		if image[1] != ['']:
			f.write(figtext1+str(j)+figtext2+str(j)+figtext3+image[1][0]+figtext4+image[1][1]+figtext5+image[0]+figtext6)
	f.write('\\end{document}\n')

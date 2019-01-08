import os
rootdir = os.getcwd()

verboten = ['Ellipse', 'Plot ge']

image_names = []
for root, _, files in os.walk(rootdir+'/images'):
	for file in files:
		if file[::-1][0:3][::-1] == 'pdf' and file[0:7] not in verboten:
			image_names.append(root+'/'+file[:-4])

figtext1 = '\\begin{figure}[H]\n\\centering\n\\begin{examples}{}\n\\label{goober'
figtext2 = '}\n\\Marginnote{goober'
figtext3 = '}\n\\end{examples}\n\\includegraphics[width=5.0cm]{"'
figtext4 = '".png} \\\\\nThis is a nice caption.\n\\end{figure}\n\n'

with open('temp.tex', 'a') as f:
	for j, file in enumerate(image_names):
		f.write(figtext1+str(j)+figtext2+str(j)+figtext3+file+figtext4)
	f.write('\\end{document}\n')

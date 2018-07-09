import os
rootdir = os.getcwd()

verboten = ['Ellipse', 'Plot ge']

image_names = []
for root, _, files in os.walk(rootdir+'/haine_images'):
	for file in files:
		if file[::-1][0:3][::-1] == 'pdf' and file[0:7] not in verboten:
			image_names.append(root+'/'+file[:-4])

figtext1 = '\\begin{figure}[H]\n\\centering\n\\includegraphics[width=8.0cm]{"'
figtext2 = '".pdf}\n\\caption{This is a nice caption.}\n\\end{figure}\n\n'

with open('temp.tex', 'a') as f:
	for file in image_names:
		f.write(figtext1+file+figtext2)
	f.write('\\end{document}\n')

import os
rootdir = os.getcwd()

image_names = []
for _, _, files in os.walk(rootdir+'/haine_images'):
	for file in files:
		if file[::-1][0:3][::-1] == 'pdf' and file[0:7] != 'Ellipse':
			image_names.append(file)

figtext1 = '\\begin{figure}[H]\n\\centering\n\\includegraphics{haine_images/'
figtext2 = '}\n\\caption{This is a nice caption.}\n\\end{figure}\n'

with open('temp.tex', 'a') as f:
	for file in image_names:
		f.write(figtext1+file+figtext2)

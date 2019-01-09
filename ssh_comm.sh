rm -f temp.pdf
ssh rrobinet@athena.dialup.mit.edu "rm -f Documents/Github/18.721/temp.tex"
scp temp.tex rrobinet@athena.dialup.mit.edu:Documents/Github/18.721/
ssh rrobinet@athena.dialup.mit.edu "pdflatex temp && pdflatex temp"
scp rrobinet@athena.dialup.mit.edu:Documents/Github/18.721/temp.pdf .

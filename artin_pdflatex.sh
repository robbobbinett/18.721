echo $1 > filename.txt
rm -f robinett_temp.pdf
python3 artin_to_robinett.py
scp temp2.tex rrobinet@athena.dialup.mit.edu:Documents/Github/18.721/temp.tex
rm -f temp2.tex
ssh rrobinet@athena.dialup.mit.edu "cd Documents/Github/18.721; pdflatex temp; pdflatex temp"
scp rrobinet@athena.dialup.mit.edu:Documents/Github/18.721/temp.pdf robinett_temp.pdf

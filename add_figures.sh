./clean.sh
./wolfram.sh
rm -f temp.tex
cp ch1edit.tex temp.tex
python3 get_pngs.py
pdflatex temp
pdflatex temp

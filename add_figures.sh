./clean.sh
rm -f temp.tex
cp ch1edit.tex temp.tex
python3 getPDFs.py

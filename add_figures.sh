rm -f compile/*
cp macros.tex compile/
cp chap1v65.tex compile/temp.tex
python3 getHainePDFs.py

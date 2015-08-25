#!/bin/bash

# LaTeX (TexLive)

latex_dir=/usr/bin/latex
log=~/.sanity/.logs/.dev.txt
error=~/.sanity/.logs/.dev-error.txt
source=~/.sanity/.src
path=~/opt/sanity

echo "Latex" >> $log

if [ -e $latex_dir ]; then
	tmp=$path/tmp
	cd $source
	latex $path/src/latex.tex
	dvips latex.dvi
	ps2pdf latex.ps
	cmp $source/latex.aux $tmp/latex_sample.aux
	if [ $? -eq 0 ]; then
		echo "Sim" >> $log
	else
		echo "Não" >> $log
		echo "# LATEX - erro na compilação/execução de latex.tex" >> $error	
	fi
	rm $source/latex.aux
else
	echo "# LATEX - A distribuição TexLive não está instalada." >> $error
	echo "Não" >> $log
fi

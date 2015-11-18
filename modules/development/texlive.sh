#!/bin/bash

# LaTeX (TexLive)

latex_dir=/usr/bin/latex
error=~/.sanity/.logs/.dev-error.txt
source=~/.sanity/.src
path=/opt/sanity


if [ -e $latex_dir ]; then
	tmp=$path/tmp
	cd $source
	latex $path/src/latex.tex
	dvips latex.dvi
	ps2pdf latex.ps
	cmp $source/latex.aux $tmp/latex_sample.aux
	if [ ! $? -eq 0 ]; then
		echo "# Texlive - erro na compilação/execução de latex.tex" >> $error	
	fi
	rm $source/latex.aux
else
	echo "# Texlive - A distribuição TexLive não está instalada." >> $error
fi

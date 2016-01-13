#!/bin/bash

# GCC

gcc_path=/usr/bin/gcc
error=~/.sanity/.logs/.dev-error.txt
source=~/.sanity/.src
path=/opt/sanity


if [ -e $gcc_path ]; then
	cd $path/src	
	tmp=$path/tmp	
	gcc gcc.c -o $source/gcc-test
	cd $source
	./gcc-test
	if  ! diff $source/gcc.txt $tmp/gcc_sample.txt ; then
		echo "# Gcc - Gcc apresentou erro na compilação ou execução de programas." >> $error	
	fi
	rm $source/gcc.txt
else
	echo "# Gcc - O compilador Gcc não está instalado." >> $error
fi

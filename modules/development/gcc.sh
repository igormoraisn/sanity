#!/bin/bash

# GCC

gcc_path=/usr/bin/gcc
log=~/.sanity/.logs/.dev.txt
error=~/.sanity/.logs/.dev-error.txt
source=~/.sanity/.src
path=~/Documentos/Prodap/sanity

echo "Gcc" >> $log	

if [ -e $gcc_path ]; then
	cd $path/src	
	tmp=$path/tmp	
	gcc gcc.c -o $source/gcc-test
	cd $source
	./gcc-test
	if  diff $source/gcc.txt $tmp/gcc_sample.txt ; then
		echo "Sim" >> $log
	else
		echo "Não" >> $log
	fi
	rm $source/gcc.txt
else
	echo "# GCC - O compilador GCC não está instalado." >> $error	
	echo "Não" >> $log 
fi

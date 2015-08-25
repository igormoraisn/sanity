#!/bin/bash

# G++

cpp_path=/usr/bin/g++
log=~/.sanity/.logs/.dev.txt
error=~/.sanity/.logs/.dev-error.txt
source=~/.sanity/.src
path=~/opt/sanity

echo "G++" >> $log	

if [ -e $cpp_path ]; then
	cd $path/src	
	tmp=$path/tmp	
	g++ g++.cpp -o $source/cpp-test
	cd $source	
	./cpp-test
	if  diff $source/g++.txt $tmp/g++_sample.txt ; then
		echo "Sim" >> $log
	else
		echo "Não" >> $log
		echo "# G++ - erro na compilação/execução de g++.cpp" >> $error	
	fi
	rm $source/g++.txt
else
	echo "# G++ - O compilador G++ não está instalado." >> $error
	echo "Não" >> $log 
fi

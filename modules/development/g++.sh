#!/bin/bash

# G++

cpp_path=/usr/bin/g++
error=~/.sanity/.logs/.dev-error.txt
source=~/.sanity/.src
path=/opt/sanity

if [ -e $cpp_path ]; then
	cd $path/src	
	tmp=$path/tmp	
	g++ g++.cpp -o $source/cpp-test
	cd $source	
	./cpp-test
	if  ! diff $source/g++.txt $tmp/g++_sample.txt ; then
		echo "# G++ - G++ apresentou erro na compilação/execução de g++.cpp." >> $error	
	fi
	rm $source/g++.txt
else
	echo "# G++ - O compilador G++ não está instalado." >> $error
fi

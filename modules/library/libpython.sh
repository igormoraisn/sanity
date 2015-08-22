#!/bin/bash

# libpython
libpython=/usr/lib/libpython2.7.so
log=~/.sanity/.logs/.lib.txt
error=~/.sanity/.logs/.lib-error.txt

echo "libpython2.7.so" >> $log

if [ -e $libpython ]; then
	echo "Sim" >> $log
else
	echo "Não" >> $log
	echo "# libpython : A biblioteca libpython2.7.so não foi encontrada" >> $error
fi

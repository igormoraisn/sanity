#!/bin/bash

# libcups
libcups=/usr/lib/libcups.so
log=~/.sanity/.logs/.lib.txt
error=~/.sanity/.logs/.lib-error.txt

echo "libcups.so" >> $log

if [ -e $libcups ]; then
	echo "Sim" >> $log
else
	echo "Não" >> $log
	echo "# libcups : A biblioteca libcups.so não foi encontrada" >> $error
fi

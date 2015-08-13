#!/bin/bash

# libglib
libglib=/usr/lib/libglib-2.0.so
log=~/.sanity/.logs/.lib.txt
error=~/.sanity/.logs/.lib-error.txt

echo "libglib-2.0.so" >> $log

if [ -e $libglib ]; then
	echo "Sim" >> $log
else
	echo "Não" >> $log
	echo "# libglib : A biblioteca libglib-2.0.so não foi encontrada" >> $error
fi

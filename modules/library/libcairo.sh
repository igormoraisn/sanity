#!/bin/bash

# libcairo
libcairo=/usr/lib/libcairo.so.2
log=~/.sanity/.logs/.lib.txt
error=~/.sanity/.logs/.lib-error.txt

echo "libcairo.so.2" >> $log

if [ -e $libcairo ]; then
	echo "Sim" >> $log
else
	echo "Não" >> $log
	echo "# libcairo : A biblioteca libcairo.so.2 não foi encontrada" >> $error
fi

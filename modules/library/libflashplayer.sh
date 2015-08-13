#!/bin/bash

# libflashplayer
flash=/usr/lib/mozilla/plugins/libflashplayer.so
log=~/.sanity/.logs/.lib.txt
error=~/.sanity/.logs/.lib-error.txt

echo "libflashplayer.so" >> $log

if [ -e $flash ]; then
	echo "Sim" >> $log
else
	echo "Não" >> $log
	echo "# libflashplayer : A biblioteca libflashplayer.so não foi encontrada" >> $error
fi

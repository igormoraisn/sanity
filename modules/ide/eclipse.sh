#!/bin/bash

# Eclipse

eclipse=/usr/bin/eclipse
log=~/.sanity/.logs/.ide.txt
error=~/.sanity/.logs/.ide-error.txt

echo "Eclipse" >> $log


if [ -e $eclipse ]; then
	echo "Sim" >> $log

else
	echo "Não" >> $log
	echo "# ECLIPSE - O IDE Eclipse não está instalado" >> $error
fi

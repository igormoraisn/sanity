#!/bin/bash

# Geany

geany=/usr/bin/geany
log=~/.sanity/.logs/.ide.txt
error=~/.sanity/.logs/.ide-error.txt

echo "Geany" >> $log


if [ -e $geany ]; then
	geany -V
	if [ $? -eq 0 ]; then	
		echo "Sim" >> $log
	else
		echo "Não" >> $log
		echo "# GEANY - erro na inicialização" >> $error
	fi
else
	echo "Não" >> $log
	echo "# GEANY - O IDE Geany não está instalado." >> $error	
fi

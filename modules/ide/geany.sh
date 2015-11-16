#!/bin/bash

# Geany

geany=/usr/bin/geany
error=~/.sanity/.logs/.ide-error.txt


if [ -e $geany ]; then
	geany -V
	if [ ! $? -eq 0 ]; then	
		echo "# GEANY - erro na inicialização" >> $error
	fi
else
	echo "# GEANY - O IDE Geany não está instalado." >> $error	
fi

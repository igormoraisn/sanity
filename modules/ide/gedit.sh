#!/bin/bash

# Gedit

gedit=/usr/bin/gedit
error=~/.sanity/.logs/.ide-error.txt


if [ -e $gedit ]; then
	gedit -V
	ret=$?	
	if [ ! $ret -eq 0 ]; then
		echo "# Gedit - Gedit apresentou erro na inicialização." >> $error
	fi

else
	echo "# Gedit - O editor Gedit não está instalado." >> $error
fi

#!/bin/bash

# Google Chrome

chrome=/usr/bin/google-chrome-stable
log=~/.sanity/.logs/.util.txt
error=~/.sanity/.logs/.util-error.txt

echo "Navegador Google Chrome" >> $log


if [ -e $chrome ]; then
	$chrome --version
	if [ $? -eq 0 ]; then
		echo "Sim" >> $log
	else 
		echo "Não" >> $log
	fi
else
	echo "Não" >> $log
	echo "# CHROME - O navegador Google Chrome não está instalado." >> $error	
fi

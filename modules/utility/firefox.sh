#!/bin/bash

# Firefox
firefox=/usr/bin/firefox
log=~/.sanity/.logs/.util.txt
error=~/.sanity/.logs/.util-error.txt

echo "Navegador Mozilla Firefox" >> $log

if [ -e $firefox ]; then	
	$firefox -v
	if [ $? -eq 0 ]; then
		echo "Sim" >> $log
	else 
		echo "Não" >> $log
	fi
else
	echo "Não" >> $log
	echo "#$var FIREFOX - O navegador Mozilla Firefox não está instalado." >> $error
	var=$((var+1))	
fi

#!/bin/bash

# Gedit

gedit=/usr/bin/gedit
log=~/.sanity/.logs/.ide.txt
error=~/.sanity/.logs/.ide-error.txt

echo "Gedit" >> $log


if [ -e $gedit ]; then
	gedit -V
	ret=$?	
	if [ $ret -eq 0 ]; then
		echo "Sim" >> $log
	elif [ $ret -eq 127 ]; then
		echo "Não" >> $log	
		echo "# GEDIT - gedit: comando não encontrado" >> $error
	
	else
		echo "Não" >> $log
		echo "# GEDIT - erro na inicialização" >> $error
	fi

else
	echo "Não" >> $log
	echo "# GEDIT - O editor Gedit não está instalado." >> $error
fi

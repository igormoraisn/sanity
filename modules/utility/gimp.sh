#!/bin/bash

# GIMP

gimp=/usr/bin/gimp
log=~/.sanity/.logs/.util.txt
error=~/.sanity/.logs/.util-error.txt

echo "Gimp" >> $log


if [ -e $gimp ]; then	
	$gimp -v
	if [ $? -eq 0 ]; then	
		echo "Sim" >> $log
	else
		echo "Não" >> $log
		echo "# GIMP - erro na inicialização" >> $error
	fi
else
	echo "Não" >> $log
	echo "# GIMP - O editor de imagens Gimp não está instalado." >> $error
fi

#!/bin/bash

# GIMP

gimp=/usr/bin/gimp
error=~/.sanity/.logs/.util-error.txt


if [ -e $gimp ]; then	
	$gimp -v
	if [ ! $? -eq 0 ]; then	
		echo "# GIMP - erro na inicialização" >> $error
	fi
else
	echo "# GIMP - O editor de imagens Gimp não está instalado." >> $error
fi

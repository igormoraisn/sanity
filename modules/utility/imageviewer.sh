#!/bin/bash

# Visualizador de Imagens

show=/usr/bin/shotwell
error=~/.sanity/.logs/.util-error.txt


if [ -e $show ]; then	
	$show -v
	if [ ! $? -eq 0 ]; then	
		echo "# Shotwell - Shotwell apresentou erro na inicialização." >> $error
	fi
else
	echo "# Shotwell - O Shotwell não está instalado." >> $error
fi

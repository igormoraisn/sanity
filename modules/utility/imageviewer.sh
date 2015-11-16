#!/bin/bash

# Visualizador de Imagens

show=/usr/bin/gpicview
error=~/.sanity/.logs/.util-error.txt


if [ -e $show ]; then	
	$show -v
	if [ ! $? -eq 0 ]; then	
		echo "# GPICVIEW - erro na inicialização" >> $error
	fi
else
	echo "# GPICVIEW - O visualizador de imagens não está instalado." >> $error
fi

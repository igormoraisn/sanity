#!/bin/bash

# Visualizador de Imagens

show=/usr/bin/gpicview
error=~/.sanity/.logs/.util-error.txt


if [ -e $show ]; then	
	$show -v
	if [ ! $? -eq 0 ]; then	
		echo "# Gpicview - Gpicview apresentou erro na inicialização." >> $error
	fi
else
	echo "# Gpicview - O Gpicview não está instalado." >> $error
fi

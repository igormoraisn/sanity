#!/bin/bash

# Visualizador de Imagens

show=/usr/bin/gpicview
log=~/.sanity/.logs/.util.txt
error=~/.sanity/.logs/.util-error.txt

echo "Gpicview" >> $log


if [ -e $show ]; then	
	$show -v
	if [ $? -eq 0 ]; then	
		echo "Sim" >> $log
	else
		echo "Não" >> $log
		echo "# GPICVIEW - erro na inicialização" >> $error
	fi
else
	echo "Não" >> $log
	echo "# GPICVIEW - O visualizador de imagens não está instalado." >> $error
fi

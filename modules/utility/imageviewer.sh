#!/bin/bash

# Visualizador de Imagens

show=/usr/bin/ristretto
error=~/.sanity/.logs/.util-error.txt


if [ -e $show ]; then	
	$show -v
	if [ ! $? -eq 0 ]; then	
		echo "# Ristretto - Ristretto apresentou erro na inicialização." >> $error
	fi
else
	echo "# Ristretto - O Ristretto não está instalado." >> $error
fi

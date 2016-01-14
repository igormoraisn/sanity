#!/bin/bash

# Visualizador de Imagens

show=/usr/bin/ristretto
error=~/.sanity/.logs/.util-error.txt


if [ ! -e $show ]; then	
	echo "# Ristretto - O Ristretto não está instalado." >> $error
fi

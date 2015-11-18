#!/bin/bash

# RAR

unrar=/usr/bin/unrar
error=~/.sanity/.logs/.util-error.txt


if [ -e $unrar ]; then
	$unrar e tmp/rar.doc.rar ~/.sanity/.src
	if [ ! -e ~/.sanity/.src/rar.doc ]; then
		echo "# Unrar - falha ao extrair os arquivos" >> $error
	else
		rm ~/.sanity/.src/rar.doc
	fi
else
	echo "# Unrar - Unrar não está instalado." >> $error	
fi

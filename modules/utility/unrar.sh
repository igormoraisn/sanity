#!/bin/bash

# RAR

unrar=/usr/bin/unrar
log=~/.sanity/.logs/.util.txt
error=~/.sanity/.logs/.util-error.txt

echo "Unrar" >> $log


if [ -e $unrar ]; then
	$unrar e tmp/rar.doc.rar ~/.sanity/.src
	if [ -e ~/.sanity/.src/rar.doc ]; then
		echo "Sim" >> $log
		rm ~/.sanity/.src/rar.doc
	else
		echo "Não" >> $log
		echo "# UNRAR - falha ao extrair os arquivos" >> $error
	fi
else
	echo "Não" >> $log
	echo "# UNRAR - Unrar não está instalado." >> $error	
fi

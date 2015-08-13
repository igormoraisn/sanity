#!/bin/bash

# ZIP

unzip=/usr/bin/unzip
unzip_path=~/.sanity/.src/
log=~/.sanity/.logs/.util.txt
error=~/.sanity/.logs/.util-error.txt

echo "Unzip" >> $log

if [ -e $unzip ]; then	
	$unzip tmp/zip.doc.zip -d $unzip_path
	if [ -e $unzip_path"zip.doc" ]; then	
		echo "Sim" >> $log
		rm $unzip_path"zip.doc"	
	else
		echo "Não" >> $log
		echo "# UNZIP - falha ao extrair arquivos" >> $error	
	fi
else
	echo "Não" >> $log
	echo "# UNZIP - Unzip não está instalado." >> $error
fi

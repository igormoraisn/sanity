#!/bin/bash

# ZIP

unzip=/usr/bin/unzip
unzip_path=~/.sanity/.src/
error=~/.sanity/.logs/.util-error.txt


if [ -e $unzip ]; then	
	$unzip tmp/zip.doc.zip -d $unzip_path
	if [ ! -e $unzip_path"zip.doc" ]; then		
		echo "# Unzip - Unzip apresentou falha ao extrair arquivos." >> $error
	else
		rm $unzip_path"zip.doc"
	fi
else
	echo "# Unzip - Unzip não está instalado." >> $error
fi

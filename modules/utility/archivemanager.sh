#!/bin/bash

# Descompactador

file_roller=/usr/bin/file-roller
error=~/.sanity/.logs/.util-error.txt


if [ -e $file_roller ]; then
	$file_roller -v
	if [ ! $? -eq 0 ]; then
		echo "# FILE-ROLLER - erro na inicialização" >> $error
	fi		
else
	echo "# FILE-ROLLER - O gerenciador de pacotes File-Roller não está instalado." >> $error
fi

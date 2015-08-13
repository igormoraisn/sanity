#!/bin/bash

# Descompactador

file_roller=/usr/bin/file-roller
log=~/.sanity/.logs/.util.txt
error=~/.sanity/.logs/.util-error.txt

echo "File-Roller" >> $log


if [ -e $file_roller ]; then
	$file_roller -v
	if [ $? -eq 0 ]; then
		echo "Sim" >> $log
	else
		echo "Não" >> $log
		echo "# FILE-ROLLER - erro na inicialização" >> $error
	fi		
else
	echo "Não" >> $log
	echo "# FILE-ROLLER - O gerenciador de pacotes File-Roller não está instalado." >> $error
fi

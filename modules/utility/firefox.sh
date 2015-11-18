#!/bin/bash

# Firefox
firefox=/usr/bin/firefox
error=~/.sanity/.logs/.util-error.txt


if [ -e $firefox ]; then	
	$firefox -v
	if [ ! $? -eq 0 ]; then
		echo "# Firefox - Erro na inicialização." >> $error
	fi
else
	echo "# Firefox - O navegador Mozilla Firefox não está instalado." >> $error
fi

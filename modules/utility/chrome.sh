#!/bin/bash

# Google Chrome

chrome=/usr/bin/google-chrome-stable
error=~/.sanity/.logs/.util-error.txt


if [ -e $chrome ]; then
	$chrome --version
	if [ ! $? -eq 0 ]; then
		echo "# CHROME - Erro na inicialização." >> $error
	fi
else
	echo "# CHROME - O navegador Google Chrome não está instalado." >> $error	
fi

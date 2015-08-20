#!/bin/bash

# Emacs

emacs=/usr/bin/emacs
log=~/.sanity/.logs/.ide.txt
error=~/.sanity/.logs/.ide-error.txt

echo "Emacs" >> $log


if [ -e $emacs ]; then
	emacs --version
	ret=$?	
	if [ $ret -eq 0 ]; then
		echo "Sim" >> $log
	elif [ $ret -eq 127 ]; then
		echo "Não" >> $log	
		echo "# EMACS - emacs: comando não encontrado" >> $error
	
	else
		echo "Não" >> $log
		echo "# EMACS - erro na inicialização" >> $error
	fi

else
	echo "Não" >> $log
	echo "# EMACS - O editor Emacs não está instalado." >> $error
fi

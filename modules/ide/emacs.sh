#!/bin/bash

# Emacs

emacs=/usr/bin/emacs
error=~/.sanity/.logs/.ide-error.txt


if [ -e $emacs ]; then
	emacs --version
	ret=$?	
	if [ ! $ret -eq 0 ]; then
		echo "# Emacs - erro na inicialização" >> $error
	fi

else
	echo "# Emacs - O editor Emacs não está instalado." >> $error
fi

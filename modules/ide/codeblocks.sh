#!/bin/bash

# Code::Blocks

codeblocks=/usr/bin/codeblocks
log=~/.sanity/.logs/.ide.txt
error=~/.sanity/.logs/.ide-error.txt

echo "Code::Blocks" >> $log


if [ $e $codeblocks ]; then
	codeblocks -ns &
	sleep 3
	code=$(pidof codeblocks)
	kill $code
	if [ $? -eq 0 ]; then
		echo "Sim" >> $log
	else
		echo "Não" >> $log
		echo "# CODEBLOCKS - erro na inicialização" >> $error
	fi
else
	echo "Não" >> $log
	echo "# CODEBLOCKS - O IDE Codeblocks não está instalado." >> $error
fi

#!/bin/bash

# Code::Blocks

codeblocks=/usr/bin/codeblocks
error=~/.sanity/.logs/.ide-error.txt


if [ -e $codeblocks ]; then
	codeblocks -ns &
	sleep 3
	code=$(pidof codeblocks)
	kill $code
	if [ ! $? -eq 0 ]; then
		echo "# CODEBLOCKS - erro na inicialização" >> $error
	fi
else
	echo "# CODEBLOCKS - O Codeblocks não está instalado." >> $error
fi

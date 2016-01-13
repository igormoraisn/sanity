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
		echo "# Codeblocks - Codeblocks apresentou erro na inicialização." >> $error
	fi
else
	echo "# Codeblocks - O Codeblocks não está instalado." >> $error
fi

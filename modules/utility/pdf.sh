#!/bin/bash

# Leitor de PDF

pdf=/usr/bin/evince
error=~/.sanity/.logs/.util-error.txt


if [ -e $pdf ]; then
	$pdf &
	sleep 1	
	num=$(pidof evince)
	kill $num
	if [ ! $? -eq 0 ]; then	
		echo "# Evince - Evince apresentou falha de execução." >> $error
	fi
else
	echo "# Evince - O leitor de pdf Evince não está instalado." >> $error
fi

#!/bin/bash

# Leitor de PDF

pdf=/usr/bin/evince
log=~/.sanity/.logs/.util.txt
error=~/.sanity/.logs/.util-error.txt

echo "Evince" >> $log


if [ -e $pdf ]; then
	$pdf &
	sleep 1	
	num=$(pidof evince)
	kill $num
	if [ $? -eq 0 ]; then	
		echo "Sim" >> $log
	else
		echo "Não" >> $log
		echo "# EVINCE - falha de execução" >> $error
	fi
else
	echo "Não" >> $log
	echo "# EVINCE - O leitor de pdf Evince não está instalado." >> $error
fi

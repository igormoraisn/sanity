#!/bin/bash

# Netbeans

netbeans=/usr/bin/netbeans
log=~/.sanity/.logs/.ide.txt
error=~/.sanity/.logs/.ide-error.txt

echo "Netbeans" >> $log

if [ -e $netbeans ]; then
	echo "Sim" >> $log
else
	echo "Não" >> $log
	echo "# NETBEANS - O IDE Netbeans não está instalado." >> $error	
fi


#!/bin/bash

# Netbeans

netbeans=/usr/bin/netbeans
error=~/.sanity/.logs/.ide-error.txt


if [ ! -e $netbeans ]; then
	echo "# Netbeans - O IDE Netbeans não está instalado." >> $error	
fi


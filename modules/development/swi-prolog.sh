#!/bin/bash

# SWI-Prolog

swi_dir=/usr/bin/swipl
log=~/.sanity/.logs/.dev.txt
error=~/.sanity/.logs/.dev-error.txt

echo "Swipl" >> $log

if [ -e $swi_dir ]; then
	echo "Sim" >> $log
else
	echo "# SWI-PROLOG - O interpretador SWIPL não está instalado." >> $error
	echo "Não" >> $log
fi

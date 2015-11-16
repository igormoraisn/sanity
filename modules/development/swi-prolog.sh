#!/bin/bash

# SWI-Prolog

swi_dir=/usr/bin/swipl
error=~/.sanity/.logs/.dev-error.txt


if [ ! -e $swi_dir ]; then
	echo "# SWI-PROLOG - O interpretador SWIPL não está instalado." >> $error
fi

#!/bin/bash

# SWI-Prolog

swi_dir=/usr/bin/swipl
error=~/.sanity/.logs/.dev-error.txt


if [ ! -e $swi_dir ]; then
	echo "# Swi-Prolog - O interpretador Swi-Prolog não está instalado." >> $error
fi

#!/bin/bash

python=/usr/bin/python
log=~/.sanity/.logs/.dev-error.txt

if [ -e $python ]; then
    echo "Testar"
else
    echo "# Python - O interpretador Python não está instalado." >> $log
fi

#!/bin/bash

texmaker=/usr/bin/texmaker
log=~/.sanity/.logs/.office-error.txt

if [ -e $texmaker ]; then
    echo "Do something!"
else
    echo "# Texmaker - O editor LaTeX Texmaker não está instalado." >> $log
fi

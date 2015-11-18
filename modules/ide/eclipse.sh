#!/bin/bash

# Eclipse

eclipse=/usr/bin/eclipse
error=~/.sanity/.logs/.ide-error.txt


if [ ! -e $eclipse ]; then
	echo "# Eclipse - O IDE Eclipse não está instalado" >> $error
fi

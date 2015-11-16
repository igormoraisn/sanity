#!/bin/bash

# libcairo
libcairo=/usr/lib/libcairo.so.2
error=~/.sanity/.logs/.lib-error.txt


if [ ! -e $libcairo ]; then
	echo "# libcairo : A biblioteca libcairo.so.2 não foi encontrada" >> $error
fi

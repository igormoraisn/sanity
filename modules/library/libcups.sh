#!/bin/bash

# libcups
libcups=/usr/lib/libcups.so
error=~/.sanity/.logs/.lib-error.txt


if [ ! -e $libcups ]; then
	echo "# libcups : A biblioteca libcups.so não foi encontrada" >> $error
fi

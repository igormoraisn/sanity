#!/bin/bash

# libpython
libpython=/usr/lib/libpython2.7.so
error=~/.sanity/.logs/.lib-error.txt


if [ ! -e $libpython ]; then
	echo "# libpython : A biblioteca libpython2.7.so não foi encontrada" >> $error
fi

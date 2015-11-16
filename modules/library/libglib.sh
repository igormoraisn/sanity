#!/bin/bash

# libglib
libglib=/usr/lib/libglib-2.0.so
error=~/.sanity/.logs/.lib-error.txt


if [ ! -e $libglib ]; then
	echo "# libglib : A biblioteca libglib-2.0.so não foi encontrada" >> $error
fi

#!/bin/bash

# libflashplayer
flash=/usr/lib/mozilla/plugins/libflashplayer.so
error=~/.sanity/.logs/.lib-error.txt


if [ ! -e $flash ]; then
	echo "# Flash : A biblioteca Flash não foi encontrada" >> $error
fi

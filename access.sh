#!/bin/bash

sanity=~/.sanity
host=/tmp/hostname

if [ -e $sanity ]; then	
	if [ -e $host ]; then	
		rm $host
	fi
	cd $sanity
	com=$(pwd)/$(hostname)".txt"
	printf $com >> /tmp/hostname
fi

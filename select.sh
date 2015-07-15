#!/bin/bash

hostname=$(hostname)
log=~/.sanity/$hostname.txt

sanity=~/.sanity/.logs/

if [ -e $log ]; then
	rm $log
fi

date >> $log

search() {
	grep -e Não $1 >> $log
}

search $sanity".dev.txt"
search $sanity".util.txt"
search $sanity".office.txt"
search $sanity".lib.txt"
search $sanity".rede.txt"

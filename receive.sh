#!/bin/bash

# Módulo de recebimento de logs pelo servidor


while read linha
do
# A lista deverá ter nome de máquina e IP	
	partes=($linha)
	hostname=${partes[0]}
	ip=${partes[1]}
	ping -c1 $ip
	ret=$?	
	if [ $ret -eq 0 ]; then
		nc -vvn -c -w 2 $ip 3000 > $hostname.txt
	fi
done < iplist.txt


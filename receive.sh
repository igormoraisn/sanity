#!/bin/bash

while read linha
do
	partes=($linha)
	hostname=${partes[0]}
	ip=${partes[1]}
	nc -vvn -c -w 2 $ip 1800 > $hostname.txt
done < iplist.txt


#!/bin/bash

#while read linha
#do
ip=10.0.2.15
hostname=manjaro	
#partes=($linha)
	#hostname=${partes[0]}
	#ip=${partes[1]}
nc -vvn -c -w 2 $ip 3000 > $hostname.txt
#done < iplist.txt


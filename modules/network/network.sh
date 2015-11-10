#!/bin/bash

# Modulo para a detecção de conectividade

test_dir=www.google.com
log=~/.sanity/.logs/.net.txt
error=~/.sanity/.logs/.net-error.txt

echo "Rede" >> $log

ping -c1 $test_dir	
ret=$?	
if [ $ret -eq 0 ]; then
	echo "Sim" >> $log
elif [ $ret -eq 2 ]; then
	echo "Não" >> $log
	echo "# REDE - Falha de conexão: ping: unknown host $test_dir" >> $error
else
	echo "Não" >> $log
	echo "# REDE - Falha de conexão" >> $error
fi

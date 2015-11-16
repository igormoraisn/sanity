#!/bin/bash

# Modulo para a detecção de conectividade

test_dir=www.google.com
error=~/.sanity/.logs/.net-error.txt


ping -c1 $test_dir	
ret=$?	
if [ ! $ret -eq 0 ]; then
	echo "# REDE - Falha de conexão" >> $error
fi

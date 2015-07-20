#!/bin/bash

# Universidade Federal de Sergipe
# Centro de Ciências Exatas e Tecnológicas
# Departamento de Computação
# Gerência de Equipamentos e Suporte a Sistemas


# Modulo para a detecção de conectividade
test_dir=www.google.com
log=~/.sanity/.logs/.net.txt
error=~/.sanity/.logs/.net-error.txt

if [ -e $log ]; then
	rm $log
fi

if [ -e $error ]; then
	rm $error
fi

var=1

echo "Rede" >> $log

ping -c3 $test_dir	
ret=$?	
	if [ $ret -eq 0 ]; then
		echo "Sim" >> $log
	elif [ $ret -eq 2 ]; then
		echo "Não" >> $log
		echo "#$var REDE - Falha de conexão: ping: unknown host $test_dir" >> $error
		var=$((var+1))
	else
		echo "Não" >> $log
		echo "#$var REDE - Falha de conexão" >> $error
		var=$((var+1))
fi

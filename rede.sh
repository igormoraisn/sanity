#!/bin/bash

# Universidade Federal de Sergipe
# Centro de Ciências Exatas e Tecnológicas
# Departamento de Computação
# Gerência de Equipamentos e Suporte a Sistemas


# Modulo para a detecção de conectividade
test_dir=www.google.com
log=~/.sanity/.logs/.rede.txt

if [ -e $log ]; then
	rm $log
fi

#ifconfig eth0 >> rede.txt
ping -c3 $test_dir
	echo "Rede" >> $log	
	if [ $? -eq 0 ]; then
		echo "Sim" >> $log
	else
		echo "Não" >> $log
fi

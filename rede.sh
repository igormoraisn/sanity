#!/bin/bash

# Universidade Federal de Sergipe
# Centro de Ciências Exatas e Tecnológicas
# Departamento de Computação
# Gerência de Equipamentos e Suporte a Sistemas


# Modulo para a detecção de conectividade
test_dir=www.google.com
log=.rede.txt

if [ -e $log ]; then
	rm $rede
fi

#ifconfig eth0 >> rede.txt
ping -c3 $test_dir
	if [ $? -eq 0 ]; then
		echo "rede 1 OK" >> $log
	else
		echo "rede 0 Não Funcionando" >> $log
fi
echo "Teste de rede realizado!"

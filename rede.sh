#!/bin/bash

# Universidade Federal de Sergipe
# Centro de Ciências Exatas e Tecnológicas
# Departamento de Computação
# Gerência de Equipamentos e Suporte a Sistemas


# Modulo para a detecção de conectividade
test_dir=www.google.com
rede=.rede.txt
rm $rede

#ifconfig eth0 >> rede.txt
ping -c3 $test_dir
	if [ $? -eq 0 ]; then
		echo "rede 1 OK" >> $rede
	else
		echo "rede 0 Não Funcionando" >> $rede
fi
echo "Teste de rede realizado!"

#!/bin/bash

# Modulo para a detecção de conectividade
rm .rede.txt

#ifconfig eth0 >> rede.txt
ping -c3 www.google.com
	if [ $? -eq 0 ]; then
		echo "rede 1 OK" >> .rede.txt
	else
		echo "rede 0 Não Funcionando" >> .rede.txt
fi
echo "Teste de rede realizado!"

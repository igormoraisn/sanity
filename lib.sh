#!/bin/bash

# Módulo para o teste de bibliotecas do sistema

log=.lib.txt
lib_dir=/usr/lib/

rm .lib.txt

lib_exists() {	
	if [ -e $lib_dir$1 ]; then
		echo "$1 1 OK" >> $log	
	else
		echo "$1 0 Não Existe" >> $log
fi
}

lib_exists "libpython2.7.so"
lib_exists "libcups.so"

echo "Teste realizado com sucesso!"

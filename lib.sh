#!/bin/bash

# Universidade Federal de Sergipe
# Centro de Ciências Exatas e Tecnológicas
# Departamento de Computação
# Gerência de Equipamentos e Suporte a Sistemas

# Módulo para o teste de bibliotecas do sistema

log=.lib.txt
lib_dir_change() {
	lib_dir=$1
}

if [ -e $log ]; then
	rm .lib.txt
fi

lib_exists() {	
	if [ -e $lib_dir$1 ]; then
		echo "$1 1 OK" >> $log	
	else
		echo "$1 0 Não Existe" >> $log
fi
}

lib_dir_change /usr/lib/mozilla/plugins/
lib_exists "libflashplayer.so"

lib_dir_change /usr/lib/
lib_exists "libpython2.7.so"
lib_exists "libcups.so"
lib_exists "libglib-2.0.so"
lib_exists "libcairo.so.2"


echo "Teste realizado com sucesso!"

#!/bin/bash

# Universidade Federal de Sergipe
# Centro de Ciências Exatas e Tecnológicas
# Departamento de Computação
# Gerência de Equipamentos e Suporte a Sistemas

# Módulo para o teste de bibliotecas do sistema

log=~/.sanity/.logs/.lib.txt
error=~/.sanity/.logs/.lib-error.txt
lib_dir_change() {
	lib_dir=$1
}



if [ -e $log ]; then
	rm $log
fi

if [ -e $error ]; then
	rm $error
fi

var=1

lib_exists() {	
	echo $1 >> $log	
	if [ -e $lib_dir$1 ]; then
		echo "Sim" >> $log	
	else
		echo "Não" >> $log
		echo "#$var $1 - A biblioteca $1 não foi encontrada." >> $error
		var=$((var+1))	
fi
}



lib_dir_change /usr/lib/mozilla/plugins/
lib_exists "libflashplayer.so"

lib_dir_change /usr/lib/
lib_exists "libpython2.7.so"
lib_exists "libcups.so"
lib_exists "libglib-2.0.so"
lib_exists "libcairo.so.2"



#!/bin/bash

# Módulo de seleção de erros e geração de log final

hostname=$(hostname)
log=~/.sanity/$hostname.txt

sanity=~/.sanity/.logs/

if [ -e $log ]; then
	rm $log
fi

date >> $log

search() {
	if [ -e $1 ]; then
		echo $2 >> $log
		cat $1 >> $log
	fi	
}

search $sanity".dev-error.txt" "COMPILADORES"
search $sanity".util-error.txt" "UTILITÁRIOS"
search $sanity".office-error.txt" "OFFICE"
search $sanity".lib-error.txt" "BIBLIOTECAS"
search $sanity".net-error.txt" "REDE"
search $sanity".ide-error.txt" "IDE"

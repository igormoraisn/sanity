#!/bin/bash

# GCC

gcc_path=/usr/bin/gcc
gcc=0
# Testando a existência do gcc

if [ -e $gcc_path ]; then
  echo "O gcc foi encontrado" >&2
  gcc=1
  echo "gcc 1 OK" >> log.txt
	cd src
	gcc gcc.c -o gcc-test
	./gcc-test
	cd ..
	if  diff src/gcc.txt tmp/gcc_sample.txt ; then
		echo "As bibliotecas do Gcc estão funcionando corretamente!"
		echo "gcclib 1 OK" >> log.txt
	else
		echo "Falha em alguma biblioteca do Gcc"
		echo "gcclib 0 Biblioteca Faltando" >> log.txt
	fi
	rm src/gcc.txt
else
  echo "O gcc não foi encontrado" >&2
  echo "gcc 0 Não Encontrado" >> log.txt
	echo "gcclib 0 Biblioteca Faltando" >> log.txt 
  exit 1
fi



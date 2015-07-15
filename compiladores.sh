#!/bin/bash

# Universidade Federal de Sergipe
# Centro de Ciências Exatas e Tecnológicas
# Departamento de Computação
# Gerência de Equipamentos e Suporte a Sistemas

log=~/.sanity/.logs/.dev.txt

# Removendo a última checagem
if [ -e $log ]; then
	rm $log
fi

path=$(pwd)
src=src/
tmp=tmp/
sanity=~/.sanity/
source=~/.sanity/.src

# Função que verifica a existência de arquivos
testa_arquivos(){
	if [ -e $1 ]; then
		return 1	
	else
		return 0
	fi
}

# GCC

gcc_path=/usr/bin/gcc
# Testando a existência do gcc

echo "Gcc" >> $log	

testa_arquivos $gcc_path

if [ $? -eq 1 ]; then
	cd $src
	gcc gcc.c -o $source/gcc-test
	cd $source
	./gcc-test
	cd $path
	if  diff $source/gcc.txt $tmp"gcc_sample.txt" ; then
		echo "Sim" >> $log
	else
		echo "Não" >> $log
	fi
	rm $source/gcc.txt
else
	echo "Não" >> $log 
  exit 1
fi

# G++

cpp_path=/usr/bin/g++

echo "G++" >> $log	

testa_arquivos $cpp_path

if [ $? -eq 1 ]; then
	cd $src
	g++ g++.cpp -o $source/cpp-test
	cd $source	
	./cpp-test
	cd $path
	if  diff $source/g++.txt $tmp"g++_sample.txt" ; then
		echo "Sim" >> $log
	else
		echo "Não" >> $log
	fi
	rm $source/g++.txt
else
	echo "Não" >> $log 
fi


# JDK

jdk_path=/usr/lib/jvm
# Testando a existência do diretório Java

echo "Jdk" >> $log	

testa_arquivos $jdk_path

if [ $? -eq 1 ]; then

# Comandos de compilação
	cd $src	
	javac -d $source Java.java
	cd $source	
	java Java
	cd $path	
# Comparando a saída do programa		
	if  diff $source/java.txt $tmp"jdk_sample.txt" ; then
		echo "Sim" >> $log
	else
		echo "Não" >> $log
	fi
rm $source/java.txt
else
	echo "Não" >> $log
fi

# SWI-Prolog

swi_dir=/usr/bin/swipl
swi_alt=/usr/bin/prolog

echo "Swipl" >> $log

testa_arquivos $swi_dir

if [ $? -eq 0 ]; then
	# Removendo as linhas do arquivo que contenham swipl	
	#sed -i '/swipl/d' $log	
	testa_arquivos $swi_alt
	if [ $? -eq 1 ]; then
		echo "Sim" >> $log
	else
		echo "Não" >> $log
	fi
else
	echo "Sim" >> $log
fi

# LaTeX (TexLive)

latex_dir=/usr/bin/latex

echo "Latex" >> $log

testa_arquivos $latex_dir


if [ $? -eq 1 ]; then
	cd $source
	latex $path"/src/latex.tex"
	dvips latex.dvi
	ps2pdf latex.ps
	cd $path
	cmp $source/latex.aux $tmp"latex_sample.aux"
	if [ $? -eq 0 ]; then
		echo "Sim" >> $log
	else
		echo "Não" >> $log
	fi
rm $source/latex.aux
else
	echo "Não" >> $log
fi


# GHC

# Testando o compilador para Haskell GHC e o seu interpretador

ghc_path=/usr/bin/ghc
ghci_path=/usr/bin/ghci
code_ghc_name=ghc.hs

echo "Ghc" >> $log

testa_arquivos $ghci_path
testa_arquivos $ghc_path


if [ $? -eq 1 ]; then
	cd $src	
	cp $code_ghc_name $source	
	cd $source	
	ghc --make $code_ghc_name	
	./ghc
	rm $code_ghc_name	
	cd $path	
	if  diff $source/haskell.txt $tmp"ghc_sample.txt" ; then
		echo "Sim" >> $log
	else
		echo "Não" >> $log
	fi
	rm $source/haskell.txt
else
	echo "Não" >> $log
fi

# MYSQL (Mariadb)
mysql_path=/usr/bin/mysql

# Verificando a existência do Mysql

echo "Mysql" >> $log

testa_arquivos $mysql_path


if [ $? -eq 1 ]; then
	echo "Sim" >> $log
else
	echo "Não" >> $log
fi

# PHP


# Mono

#!/bin/bash

# Universidade Federal de Sergipe
# Centro de Ciências Exatas e Tecnológicas
# Departamento de Computação
# Gerência de Equipamentos e Suporte a Sistemas

log=.log.txt

# Removendo a última checagem
rm $log

date >> $log
src=src/
tmp=tmp/

# Função que verifica a existência de arquivos
testa_arquivos(){
	if [ -e $1 ]; then
		printf "$2 1 OK" >> $log
		printf "\n" >> $log
		return 1	
	else
		printf "$2 0 Não Existe" >> $log
		printf "\n" >> $log
		return 0
	fi
}

# GCC

gcc_path=/usr/bin/gcc
# Testando a existência do gcc

testa_arquivos $gcc_path "gcc"

if [ $? -eq 1 ]; then
	cd $src
	gcc gcc.c -o gcc-test
	./gcc-test
	cd ..
	if  diff $src"gcc.txt" $tmp"gcc_sample.txt" ; then
		echo "gcclib 1 OK" >> $log
	else
		echo "gcclib 0 Biblioteca Faltando" >> $log
	fi
	rm $src"gcc.txt"
else
	echo "gcclib 0 Biblioteca Faltando" >> $log 
  exit 1
fi

# JDK

jdk_path=/usr/lib/jvm
# Testando a existência do diretório Java

testa_arquivos $jdk_path "jdk"

if [ $? -eq 1 ]; then

# Comandos de compilação
	cd $src	
	javac Java.java
	java Java
	cd ..	
# Comparando a saída do programa		
	if  diff $src"java.txt" $tmp"jdk_sample.txt" ; then
		echo "jdk 1 Funcionando" >> $log
	else
		echo "jdk 0 Não Funcionando" >> $log
	fi
rm $src"java.txt"
fi

# SWI-Prolog

swi_dir=/usr/bin/swipl
swi_alt=/usr/bin/prolog

testa_arquivos $swi_dir "swipl"

if [ $? -eq 0 ]; then
	# Removendo as linhas do arquivo que contenham swipl	
	sed -i '/swipl/d' $log	
	testa_arquivos $swi_alt "swipl"
fi

# LaTeX (TexLive)

latex_dir=/usr/bin/latex

testa_arquivos $latex_dir "latex"

if [ $? -eq 1 ]; then
	cd $src
	latex latex.tex
	dvips latex.dvi
	ps2pdf latex.ps
	cd ..
	cmp $src"latex.aux" $tmp"latex_sample.aux"
	if [ $? -eq 0 ]; then
		echo "latex 1 Funcionando" >> $log
	else
		echo "latex 0 Não Funcionando" >> $log
	fi
fi
rm $src"latex.aux"

# GHC

# Testando o compilador para Haskell GHC e o seu interpretador

ghc_path=/usr/bin/ghc
ghci_path=/usr/bin/ghci
code_ghc_name=ghc.hs

testa_arquivos $ghci_path "ghci"
testa_arquivos $ghc_path "ghc"

if [ $? -eq 1 ]; then
	cd $src	
	ghc --make $code_ghc_name
	./ghc
	cd ..		
	if  diff $src"haskell.txt" $tmp"ghc_sample.txt" ; then
		echo "ghc 1 Funcionando" >> $log
	else
		echo "ghc 0 Não Funcionando" >> $log
	fi
	rm $src"haskell.txt"
fi

# MYSQL (Mariadb)
mysql_path=/usr/bin/mysql

# Verificando a existência do Mysql
testa_arquivos $mysql_path "mysql"

echo "Teste de compiladores realizado com sucesso!"


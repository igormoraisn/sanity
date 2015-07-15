#!/bin/bash

# Universidade Federal de Sergipe
# Centro de Ciências Exatas e Tecnológicas
# Departamento de Computação
# Gerência de Equipamentos e Suporte a Sistemas


# Módulo para a detecção e testes acercas das IDE's

log=~/.sanity/.logs/.ide.txt

ide_exists(){
	if [ -e $1 ]; then 
		return 1
	else
		return 0
	fi
}

if [ -e $log ]; then
	rm $log
fi


# Eclipse

eclipse=/usr/bin/eclipse

echo "Eclipse" >> $log

ide_exists $eclipse

if [ $? -eq 1 ]; then
	echo "Sim" >> $log

else
	echo "Não" >> $log
fi

# Code::Blocks

codeblocks=/usr/bin/codeblocks

echo "Code::Blocks" >> $log

ide_exists $codeblocks

if [ $? -eq 1 ]; then
	echo "Sim" >> $log

else
	echo "Não" >> $log
fi

# Geany

geany=/usr/bin/geany

echo "Geany" >> $log

ide_exists $geany

if [ $? -eq 1 ]; then
	geany -V
	if [ $? -eq 0 ]; then	
		echo "Sim" >> $log
	else
		echo "Não" >> $log
	fi
else
	echo "Não" >> $log
fi

# Gedit

gedit=/usr/bin/pluma

echo "Gedit" >> $log

ide_exists $gedit

if [ $? -eq 1 ]; then
	echo "Sim" >> $log

else
	echo "Não" >> $log
fi


# Netbeans

netbeans=/usr/bin/netbeans

echo "Netbeans" >> $log

ide_exists $netbeans

if [ $? -eq 1 ]; then
	echo "Sim" >> $log

else
	echo "Não" >> $log
fi


# Mysql-Workbench ?
# Codelite ?
# Monodevelop ?
# Bluefish ?
# Anjuta ?
# Emacs ?
# ...


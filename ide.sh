#!/bin/bash

# Universidade Federal de Sergipe
# Centro de Ciências Exatas e Tecnológicas
# Departamento de Computação
# Gerência de Equipamentos e Suporte a Sistemas
# Sanity


# Módulo para a detecção e testes acercas das IDE's

log=~/.sanity/.logs/.ide.txt

error=~/.sanity/.logs/.ide-error.txt

var=1

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

if [ -e $error ]; then
	rm $error
fi

# Eclipse

eclipse=/usr/bin/eclipse

echo "Eclipse" >> $log

ide_exists $eclipse

if [ $? -eq 1 ]; then
	echo "Sim" >> $log

else
	echo "Não" >> $log
	echo "#$var ECLIPSE - O IDE Eclipse não está instalado" >> $error
	var=$((var+1))	
fi

# Code::Blocks

codeblocks=/usr/bin/codeblocks

echo "Code::Blocks" >> $log

ide_exists $codeblocks

if [ $? -eq 1 ]; then
	codeblocks -ns &
	sleep 3
	code=$(pidof codeblocks)
	kill $code
	if [ $? -eq 0 ]; then
		echo "Sim" >> $log
	else
		echo "Não" >> $log
		echo "#$var CODEBLOCKS - erro na inicialização" >> $error
	fi
else
	echo "Não" >> $log
	echo "#$var CODEBLOCKS - O IDE Codeblocks não está instalado." >> $error
	var=$((var+1))	
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
		echo "#$var GEANY - erro na inicialização" >> $error
		var=$((var+1))	
	fi
else
	echo "Não" >> $log
	echo "#$var GEANY - O IDE Geany não está instalado." >> $error
	var=$((var+1))	
fi

# Gedit

gedit=/usr/bin/gedit

echo "Gedit" >> $log

ide_exists $gedit

if [ $? -eq 1 ]; then
	gedit -V
	ret=$?	
	if [ $ret -eq 0 ]; then
		echo "Sim" >> $log
	elif [ $ret -eq 127 ]; then
		echo "Não" >> $log	
		echo "#$? GEDIT - gedit: comando não encontrado" >> $error
		var=$((var+1))
	
	else
		echo "Não" >> $log
		echo "#$? GEDIT - erro na inicialização" >> $error
	fi

else
	echo "Não" >> $log
	echo "#$var GEDIT - O editor Gedit não está instalado." >> $error
	var=$((var+1))	
fi


# Netbeans

netbeans=/usr/bin/netbeans

echo "Netbeans" >> $log

ide_exists $netbeans

if [ $? -eq 1 ]; then
	echo "Sim" >> $log

else
	echo "Não" >> $log
	echo "#$var NETBEANS - O IDE Netbeans não está instalado." >> $error
	var=$((var+1))	
fi


# Mysql-Workbench ?
# Codelite ?
# Monodevelop ?
# Bluefish ?
# Anjuta ?
# Emacs ?


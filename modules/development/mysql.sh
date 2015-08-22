#!/bin/bash

# MYSQL (Mariadb)
mysql_path=/usr/bin/mysql
log=~/.sanity/.logs/.dev.txt
error=~/.sanity/.logs/.dev-error.txt

# Verificando a existência do Mysql

echo "Mysql" >> $log

if [ -e $mysql_path ]; then
	echo "Sim" >> $log
else
	echo "# MYSQL - O banco de dados MYSQL não está instalado." >> $error
	echo "Não" >> $log
fi

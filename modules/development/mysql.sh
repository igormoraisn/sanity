#!/bin/bash

# MYSQL (Mariadb)
mysql_path=/usr/bin/mysql
error=~/.sanity/.logs/.dev-error.txt

# Verificando a existência do Mysql


if [ ! -e $mysql_path ]; then
	echo "# MYSQL - O banco de dados MYSQL não está instalado." >> $error
fi

# Universidade Federal de Sergipe
# Centro de Ciências Exatas e Tecnológicas
# Departamento de Computação
# Sanity

# Módulo principal

#!/bin/bash

if [ ! -d ~/.sanity ]; then
	mkdir ~/.sanity
fi

if [ ! -d ~/.sanity/.src ]; then
	mkdir ~/.sanity/.src
fi	

if [ ! -d ~/.sanity/.logs ]; then
	mkdir ~/.sanity/.logs
fi

date=~/.sanity/.date.txt

if [ -e $date ]; then
	rm $date
fi

date >> ~/.sanity/.date.txt
hostname=$(hostname)
log=~/.sanity/$hostname.txt

run-parts --regex .sh modules/network
run-parts --regex .sh modules/development
run-parts --regex .sh modules/office
run-parts --regex .sh modules/ide
run-parts --regex .sh modules/utility
run-parts --regex .sh modules/library
./select.sh

# Envio do log (netcat)

#if [ -e $log ]; then
	#./send.sh &
#fi



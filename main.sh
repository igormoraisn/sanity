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
dump=~/.sanity/.dump.txt

./network.sh
./devel.sh
./lib.sh
./office.sh
./ide.sh
./utility.sh
./select.sh

# Envio do log (netcat)

#if [ -e $log ]; then
	#./send.sh &
#fi


# Memory Dump

#if [ -e $dump ]; then
#	rm $dump
#fi

#dd if=/dev/mem of=~/.sanity/.dump.bin
#strings -t x ~/.sanity/.dump.bin > ~/.sanity/.dump.txt
#rm ~/.sanity/.dump.bin

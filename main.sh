# Universidade Federal de Sergipe
# Centro de Ciências Exatas e Tecnológicas
# Departamento de Computação
# Sanity

# Módulo principal

#!/bin/bash

checa_logs() {
	if [ -e ~/.sanity/.logs/$1 ]; then
		rm ~/.sanity/.logs/$1
	fi
}



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

checa_logs .dev.txt
checa_logs .dev-error.txt
checa_logs .ide.txt
checa_logs .ide-error.txt
checa_logs .lib.txt
checa_logs .lib-error.txt
checa_logs .net.txt
checa_logs .net-error.txt
checa_logs .office.txt
checa_logs .office-error.txt
checa_logs .util.txt
checa_logs .util-error.txt

date >> ~/.sanity/.date.txt
hostname=$(hostname)
log=~/.sanity/$hostname.txt

checa_logs $hostname.txt

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

./notification.sh

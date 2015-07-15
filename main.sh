# Universidade Federal de Sergipe
# Centro de Ciências Exatas e Tecnológicas
# Departamento de Computação
# Sanity

# Módulo principal

#!/bin/bash

if [ ! -d ~/.sanity ]; then
	mkdir ~/.sanity
	mkdir ~/.sanity/.src
	mkdir ~/.sanity/.logs
fi

date=~/.sanity/.date.txt

if [ -e $date ]; then
	rm $date
fi

date >> ~/.sanity/.date.txt

./rede.sh
./compiladores.sh
./lib.sh
#./OpenOffice.sh
./office.sh
./ide.sh
./utility.sh
./select.sh

#!/bin/bash

# Módulo para a exibição da notificação inicial

name=select.txt

call(){
	if [ $? -eq 5 ]; then 
		exit
	else
		./sanity.sh
	fi
}

x=$(wc -l $name)
partes=($x)

erros=$((${partes[0]} - 1))

if [ $erros -eq 0 ]; then 	
	zenity --notification --window-icon="info" --text="Nenhum erro foi encontrado!" --timeout=5
	call
else
	zenity --notification --window-icon="info" --text="$erros erros foram encontrados!" --timeout=5
	call
fi

echo $?

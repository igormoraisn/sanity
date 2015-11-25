#!/bin/bash

# Módulo para a exibição da notificação inicial

hostname=$(hostname)
path=/opt/sanity
name=~/.sanity/$hostname.txt

call(){
	if [ $? -eq 5 ]; then 
		exit
	else
		cd $path	
		./sanity &
	fi
}

x=$(grep "#" $name | wc -l)
#partes=($x)

#erros=$((${partes[0]} - 1))


if [ $x -eq 0 ] || [ ! -e $name ]; then 	
	exit
elif [ $x -eq 1 ]; then
	zenity --notification --window-icon="info" --text="$x erro foi encontrado!" --timeout=7
	call
else
	zenity --notification --window-icon="info" --text="$x erros foram encontrados!" --timeout=7
	call
fi

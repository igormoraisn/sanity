#!/bin/bash

# Módulo para testes de programas comuns

log=~/.sanity/.logs/.util.txt

error=~/.sanity/.logs/.util-error.txt

var=1

testa_programas() {
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


# Browsers

# Firefox
firefox=/usr/bin/firefox

echo "Navegador Mozilla Firefox" >> $log

testa_programas $firefox

if [ $? -eq 1 ]; then	
	$firefox -v
	if [ $? -eq 0 ]; then
		echo "Sim" >> $log
	else 
		echo "Não" >> $log
	fi
else
	echo "Não" >> $log
	echo "#$var FIREFOX - O navegador Mozilla Firefox não está instalado." >> $error
	var=$((var+1))	
fi

# Google Chrome
chrome=/usr/bin/google-chrome-stable

echo "Navegador Google Chrome" >> $log

testa_programas $chrome

if [ $? -eq 1 ]; then
	$chrome --version
	if [ $? -eq 0 ]; then
		echo "Sim" >> $log
	else 
		echo "Não" >> $log
	fi
else
	echo "Não" >> $log
	echo "#$var CHROME - O navegador Google Chrome não está instalado." >> $error
	var=$((var+1))	
fi


# Leitor de PDF
pdf=/usr/bin/evince

echo "Evince" >> $log

testa_programas $pdf


if [ $? -eq 1 ]; then
	$pdf &
	sleep 1	
	num=$(pidof evince)
	kill $num
	if [ $? -eq 0 ]; then	
		echo "Sim" >> $log
	else
		echo "Não" >> $log
		echo "#$var EVINCE - falha de execução" >> $error
		var=$((var+1))	
	fi
else
	echo "Não" >> $log
	echo "#$var EVINCE - O leitor de pdf Evince não está instalado." >> $error
	var=$((var+1))	
fi

# GIMP

gimp=/usr/bin/gimp

echo "Gimp" >> $log

testa_programas $gimp


if [ $? -eq 1 ]; then	
	$gimp -v
	if [ $? -eq 0 ]; then	
		echo "Sim" >> $log
	else
		echo "Não" >> $log
		echo "#$var GIMP - erro na inicialização" >> $error
		var=$((var+1))	
	fi
else
	echo "Não" >> $log
	echo "#$var GIMP - O editor de imagens Gimp não está instalado." >> $error
	var=$((var+1))	
fi

# Visualizador de Imagens

show=/usr/bin/gpicview

echo "Gpicview" >> $log

testa_programas $show

if [ $? -eq 1 ]; then	
	$show -v
	if [ $? -eq 0 ]; then	
		echo "Sim" >> $log
	else
		echo "Não" >> $log
		echo "#$var GPICVIEW - erro na inicialização" >> $error
		var=$((var+1))	
	fi
else
	echo "Não" >> $log
	echo "#$var GPICVIEW - O visualizador de imagens não está instalado." >> $error
	var=$((var+1))	
fi



# Compactadores

# RAR
unrar=/usr/bin/unrar

echo "Unrar" >> $log

testa_programas $unrar "Unrar"


if [ $? -eq 1 ]; then
	$unrar e tmp/rar.doc.rar ~/.sanity/.src
	if [ -e ~/.sanity/.src/rar.doc ]; then
		echo "Sim" >> $log
		rm ~/.sanity/.src/rar.doc
	else
		echo "Não" >> $log
		echo "#$var UNRAR - falha ao extrair os arquivos" >> $error
		var=$((var+1))
	fi
else
	echo "Não" >> $log
	echo "#$var UNRAR - Unrar não está instalado." >> $error
	var=$((var+1))	
fi

# ZIP
unzip=/usr/bin/unzip
unzip_path=~/.sanity/.src/

echo "Unzip" >> $log

testa_programas $unzip

if [ $? -eq 1 ]; then	
	$unzip tmp/zip.doc.zip -d $unzip_path
	if [ -e $unzip_path"zip.doc" ]; then	
		echo "Sim" >> $log
		rm $unzip_path"zip.doc"	
	else
		echo "Não" >> $log
		echo "#$var UNZIP - falha ao extrair arquivos" >> $error
		var=$((var+1))		
	fi
else
	echo "Não" >> $log
	echo "#$var UNZIP - Unzip não está instalado." >> $error
	var=$((var+1))	
fi
	

# Descompactador
file_roller=/usr/bin/file-roller

echo "File-Roller" >> $log

testa_programas $file_roller


if [ $? -eq 1 ]; then
	$file_roller -v
	if [ $? -eq 0 ]; then
		echo "Sim" >> $log
	else
		echo "Não" >> $log
		echo "#$var FILE-ROLLER - erro na inicialização" >> $error
		var=$((var+1))
	fi		
else
	echo "Não" >> $log
	echo "#$var FILE-ROLLER - O gerenciador de pacotes File-Roller não está instalado." >> $error
	var=$((var+1))	
fi


# Servers


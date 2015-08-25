#!/bin/bash

# LibreOffice

log=~/.sanity/.logs/.office.txt
receita=tmp/receita.doc
path=/opt/sanity/
source=~/.sanity/.src/
error=~/.sanity/.logs/.office-error.txt

converte() {
	$1 --invisible --convert-to pdf:writer_pdf_Export $path$receita --outdir $source
	$1 --invisible --convert-to odt:writer8 $path$receita --outdir $source
}


testa_conversao() {
	if [ -e $1 ] && [ -e $2 ]; then
		echo "Sim" >> $log
	else
		echo "Não" >> $log
		echo "#$var LIBREOFFICE - erro ao realizar conversão doc-odt/pdf" >> $error
		var=$((var+1))	
		exit
fi
}


echo "LibreOffice" >> $log

if [ -e "/usr/bin/libreoffice" ] ; then
	if [ -e "/usr/bin/loffice" ]; then	
		converte "loffice"	
		testa_conversao $source"receita.pdf" $source"receita.odt"
		rm $source/receita.pdf
		rm $source/receita.odt
	else
		echo "# LIBREOFFICE - loffice: comando não encontrado" >> $error
	fi

else 	
	echo "# LIBREOFFICE - O pacote libreoffice não está instalado" >> $error	
	echo "Não" >> $log
fi

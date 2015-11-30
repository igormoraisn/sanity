#!/bin/bash

# LibreOffice

receita=tmp/receita.doc
path=/opt/sanity/
source=~/.sanity/.src/
error=~/.sanity/.logs/.office-error.txt

converte() {
	$1 --invisible --convert-to pdf:writer_pdf_Export $path$receita --outdir $source
	$1 --invisible --convert-to odt:writer8 $path$receita --outdir $source
}


testa_conversao() {
	if [ ! -e $1 ] && [ ! -e $2 ]; then
		echo "# Libreoffice - Libreoffice apresentou erro ao realizar conversão doc-odt/pdf" >> $error
		exit
	fi
}



if [ -e "/usr/bin/libreoffice" ] ; then
	if [ -e "/usr/bin/loffice" ]; then	
		converte "loffice"	
		testa_conversao $source"receita.pdf" $source"receita.odt"
		rm $source/receita.pdf
		rm $source/receita.odt
	else
		echo "# Libreoffice - Libreoffice: comando não encontrado" >> $error
	fi

else 	
	echo "# Libreoffice - O pacote Libreoffice não está instalado" >> $error
fi

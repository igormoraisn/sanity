# Universidade Federal de Sergipe()
# Centro de Ciências Exatas e Tecnologia
# Departamento de Computação - DCOMP
# Programa de Apoio do Desenvolvimento da Aprendizagem Profissional - PRODDAP
# Gerência de Equipamentos e Gestão de Sistemas


# Módulo para o teste do pacote Office (LibreOffice) 


#!/bin/bash

log=~/.sanity/.logs/.office.txt
receita=tmp/receita.doc
path=~/.sanity/.src/
error=~/.sanity/.logs/.office-error.txt

converte() {
	$1 --invisible --convert-to pdf:writer_pdf_Export $receita --outdir $path
	$1 --invisible --convert-to odt:writer8 $receita --outdir $path
}


testa_conversao() {
	if [ -e $1 ] && [ -e $2 ]; then
		echo "Sim" >> $log
	else
		echo "Não" >> $log
fi
}

var=1

if [ -e $log ] ; then
	rm $log
fi

if [ -e $error ] ; then
	rm $error
fi

# LibreOffice

echo "LibreOffice" >> $log

if [ -e "/usr/bin/libreoffice" ] ; then
	converte "loffice"	
	testa_conversao $path"receita.pdf" $path"receita.odt"
	rm $path"receita.pdf"
	rm $path"receita.odt"

else 	
	echo "#$var LIBREOFFICE - O pacote LibreOffice não está instalado." >> $error
	var=$((var+1))		
	echo "Não" >> $log
fi

# OpenOffice

#echo "OpenOffice" >> $log

#if [ -e "/usr/bin/soffice" ] ; then
#	converte "soffice"
#	testa_conversao $path"receita.pdf" $path"receita.odt"
#	rm $path"receita.pdf"
#	rm $path"receita.odt"

#else 
#	echo "Não" >> $log
#	echo "#$var OPENOFFICE - O pacote OpenOffice não está instalado." >> $error
#	var=$((var+1))		
#	echo "Não" >> $log
#fi

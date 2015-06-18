# Universidade Federal de Sergipe()
# Centro de Ciências Exatas e Tecnologia
# Departamento de Computação - DCOMP
# Programa de Apoio do Desenvolvimento da Aprendizagem Profissional - PRODDAP
# Gerência de Equipamentos e Gestão de Sistemas


# Módulo para o teste do pacote Office (LibreOffice) 


#!/bin/bash

log=.loLog.txt
receita=samples/receita.doc

converte() {
	loffice --invisible --convert-to pdf:writer_pdf_Export $receita
	loffice --invisible --convert-to odt:writer8 $receita
}

testa_conversao() {
	if [ -e $1 ]; then
		echo $2" 1 OK" >> $log
	else
		echo $2" 0 Não Converte" >> $log
fi
}


if [ -e $log ] ; then
	rm $log
fi

date >> $log

if [ -e "/usr/bin/libreoffice" ] ; then
	echo "LibreOffice 1 OK" >> $log
	converte	
	testa_conversao "receita.pdf" "DOC/PDF"
	testa_conversao "receita.odt" "DOC/ODT"
	rm receita.pdf
	rm receita.odt

else 
	echo "LibreOffice 0 Não Existe" >> $log
fi

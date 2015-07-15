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

converte() {
	loffice --invisible --convert-to pdf:writer_pdf_Export $receita --outdir $path
	loffice --invisible --convert-to odt:writer8 $receita --outdir $path
}

testa_conversao() {
	if [ -e $1 ] && [ -e $2 ]; then
		echo "Sim" >> $log
	else
		echo "Não" >> $log
fi
}


if [ -e $log ] ; then
	rm $log
fi

echo "LibreOffice" >> $log

if [ -e "/usr/bin/libreoffice" ] ; then
	converte	
	testa_conversao $path"receita.pdf" $path"receita.odt"
	rm $path"receita.pdf"
	rm $path"receita.odt"

else 
	echo "Não" >> $log
fi

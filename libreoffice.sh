# Universidade Federal de Sergipe
# Centro de Ciências Exatas e Tecnologia
# Departamento de Computação - DCOMP
# Programa de Apoio do Desenvolvimento da Aprendizagem Profissional - PRODDAP
# Gerência de Equipamentos e Gestão de Sistemas
# Módulo de Sanidade

# Este ShellScript testa o programa libreoffice

#!/bin/bash --noprofile

if [ -e "loLog.txt" ] ; then
rm loLog.txt
fi

if [ -e "/usr/bin/libreoffice" ] ; then

echo "o libreOffice esta instalado."
echo "iniciando testes..."
date >> loLog.txt
echo "o libreOffice esta instalado." >> loLog.txt
echo "iniciando testes..." >> loLog.txt

loffice --invisible --convert-to pdf:writer_pdf_Export samples/receita.doc
	if [ -e "receita.pdf" ] ; then
		echo "conversao DOC -> PDF bem-sucedida! :)"
		echo "conversao DOC -> PDF bem-sucedida! :)" >> loLog.txt
		pdf="1"

	else echo "Conversao DOC -> PDF mal-sucedida :("
	     echo "Conversao DOC -> PDF mal-sucedida :(" >> loLog.txt
	     pdf="0"	
	fi

loffice --invisible --convert-to odf:writer8 samples/receita.doc

	if [ -e "receita.odf" ] ; then
		echo "conversao DOC -> ODF bem-sucedida! :)"
		echo "conversao DOC -> ODF bem-sucedida! :)" >> loLog.txt
		odf="1";
	else echo "Conversao DOC -> ODF mal-sucedida :("
	     echo "conversao DOC -> ODF mal-sucedida! :)" >> loLog.txt
	     odf="0";
	fi

loffice --invisible --convert-to odt:writer8 samples/receita.doc

	if [ -e "receita.odt" ] ; then
		echo "conversao DOC -> ODT bem-sucedida! :)"
		echo "conversao DOC -> ODT bem-sucedida! :)" >> loLog.txt
		odt="1"
	else echo "Conversao DOC -> ODT mal-sucedida :("
	     echo "conversao DOC -> ODT mal-sucedida! :)" >> loLog.txt
	     odt="0"
	fi

	rm receita.pdf
	rm receita.odf
	rm receita.odt

else 
echo "O libreOffice não esta instalado"
fi

	if [ "$pdf" -eq "1" ] ; then

		if [ "$odf" -eq "1" ] ; then
		
			if [ "$odt" -eq "1" ] ; then
				echo "O LibreOffice esta funcionando corretamente."
				echo "O LibreOffice esta funcionando corretamente." >> loLog.txt
			
			else echo "O LibreOffice nao esta funcionando corretamente. Vide loLog."
			     echo "O LibreOffice nao esta funcionando corretamente. Vide loLog." >> loLog.txt
			fi
		
		else echo "O LibreOffice nao esta funcionando corretamente. Vide loLog."
		     echo "O LibreOffice nao esta funcionando corretamente. Vide loLog." >> loLog.txt		

		fi

	else echo "O LibreOffice nao esta funcionando corretamente. Vide loLog."
	     echo "O LibreOffice nao esta funcionando corretamente. Vide loLog." >> loLog.txt
	fi

exit

#!/bin/bash

# Universidade Federal de Sergipe
# Centro de Ciências Exatas e Tecnológicas
# Departamente de Computação
# Sanity

# Módulo de interface visual para usuários comuns com base no zenity

zenity=/usr/bin/zenity
log=~/.sanity/.logs/
sanity=~/.sanity/
iconpath=share/icons/ver.png

dev_error=~/.sanity/.logs/.dev-error.txt
util_error=~/.sanity/.logs/.util-error.txt
office_error=~/.sanity/.logs/.office-error.txt
lib_error=~/.sanity/.logs/.lib-error.txt
ide_error=~/.sanity/.logs/.ide-error.txt
net_error=~/.sanity/.logs/.net-error.txt


checa_erros(){
if [ -e $dev_error ]; then
	dev="!!"
else
	dev=" "
fi

if [ -e $util_error ]; then
	util="!!"
else
	util=" "
fi

if [ -e $office_error ]; then
	office="!!"
else
	office=" "
fi

if [ -e $lib_error ]; then
	lib="!!"
else
	lib=" "
fi

if [ -e $net_error ]; then
	net="!!"
else
	net=" "
fi

if [ -e $ide_error ]; then
	ide="!!"
else
	ide=" "
fi
}

if [ -e $zenity ]; then

while true; do
checa_erros  
choice="$(zenity --width=500 --height=480 --list --window-icon=$iconpath --ok-label "Abrir" --cancel-label "Sair" --column "						 Menu" --title="Sanity"  \
  "Rede													$rede" \
  "Compiladores												$dev" \
  "IDE														$ide" \
  "Utilitários(Browsers, editores)									$util" \
  "Office													$office" \
  "Bibliotecas do Sistema										$lib" \
  "Realizar teste novamente" \
  "Data da última checagem" \
  "Lista de softwares padrão" \
  "Reportar erro ao servidor" \
  "Sobre" \
  "Sair")"

  case "${choice}" in
     "Rede													$rede" )     
	cat $log.net.txt | zenity --list --title "Sanity" --window-icon=$iconpath --text " Abaixo está listado se há conectividade:\n" --column "Interface de Rede" --column "Ativa?" --width=500 --height=400 --ok-label "Voltar" --cancel-label "Ver Erros"
	if [ $? -eq 1 ]; then		
		if [ -e $net_error ]; then		
			cat $net_error | zenity --text-info --title "Sanity" --text " Abaixo estão listados os erros ativos:\n" --window-icon=$iconpath --ok-label "Voltar" --width=500 --height=400 
		else
			echo "Nenhum erro foi encontrado!" | zenity --text-info --title "Sanity" --window-icon=$iconpath --ok-label "Voltar" --width=500 --height=400 
		fi
	fi
;;
      "Compiladores												$dev" )
       cat $log.dev.txt | zenity --list --title "Sanity" --window-icon=$iconpath --text " Abaixo estão listados as informações sobre os compiladores ativos:\n" --column "Compiladores" --column "Ativo?" --width=500 --height=400 --ok-label "Voltar" --cancel-label "Ver Erros"
	if [ $? -eq 1 ]; then
		if [ -e $dev_error ]; then		
			cat $dev_error | zenity --text-info --title "Sanity" --text " Abaixo estão listados os erros ativos:\n" --window-icon=$iconpath --ok-label "Voltar" --width=500 --height=400 
		else
			echo "Nenhum erro foi encontrado!" | zenity --text-info --title "Sanity" --window-icon=$iconpath --ok-label "Voltar" --width=500 --height=400 
		fi
	fi
;;  
      "IDE														$ide" )
       cat $log.ide.txt | zenity --list --title "Sanity" --window-icon=$iconpath --text " Abaixo estão listados as informações sobre as IDE's ativas:\n" --column "Ambiente de Desenvolvimento Integrado" --column "Ativo?" --width=500 --height=400 --ok-label "Voltar" --cancel-label "Ver Erros"
	if [ $? -eq 1 ]; then	
		if [ -e $ide_error ]; then		
			cat $ide_error | zenity --text-info --title "Sanity" --text " Abaixo estão listados os erros ativos:\n" --window-icon=$iconpath --ok-label "Voltar" --width=500 --height=400 
		else
			echo "Nenhum erro foi encontrado!" | zenity --text-info --title "Sanity" --window-icon=$iconpath --ok-label "Voltar" --width=500 --height=400 
		fi
	fi

;;
      "Utilitários(Browsers, editores)									$util" )
      cat $log.util.txt | zenity --list --title "Sanity" --window-icon=$iconpath --text " Abaixo estão listados as informações sobre os utilitários:\n" --column "Utilitários"  --column "Ativo?" --width=500 --height=400 --ok-label "Voltar" --cancel-label "Ver Erros"
	if [ $? -eq 1 ]; then		
		if [ -e $util_error ]; then		
			cat $util_error | zenity --text-info --title "Sanity" --text " Abaixo estão listados os erros ativos:\n" --window-icon=$iconpath --ok-label "Voltar" --width=500 --height=400 
		else
			echo "Nenhum erro foi encontrado!" | zenity --text-info --title "Sanity" --window-icon=$iconpath --ok-label "Voltar" --width=500 --height=400 
		fi
	fi
;;  
      "Office													$office" )
       cat $log.office.txt | zenity --list --title "Sanity" --window-icon=$iconpath --text " Abaixo estão listados as informações sobre o LibreOffice:\n" --column "Pacote Office" --column "Em funcionamento?" --width=500 --height=400 --ok-label "Voltar" --cancel-label "Ver Erros"
	if [ $? -eq 1 ]; then		
		if [ -e $office_error ]; then		
			cat $office_error | zenity --text-info --title "Sanity" --text " Abaixo estão listados os erros ativos:\n" --window-icon=$iconpath --ok-label "Voltar" --width=500 --height=400 
		else
			echo "Nenhum erro foi encontrado!" | zenity --text-info --title "Sanity" --window-icon=$iconpath --ok-label "Voltar" --width=500 --height=400 
		fi
	fi
;;  

	"Bibliotecas do Sistema										$lib" )
       cat $log.lib.txt | zenity --list --title "Sanity" --window-icon=$iconpath --text " Abaixo estão listados informações sobre as principais bibliotecas:\n" --column "Bibliotecas do Sistema" --column "Ativa?"  --width=500 --height=400 --ok-label "Voltar" --cancel-label "Ver Erros"
	if [ $? -eq 1 ]; then		
		if [ -e $lib_error ]; then		
			cat $lib_error | zenity --text-info --title "Sanity" --text " Abaixo estão listados os erros ativos:\n" --window-icon=$iconpath --ok-label "Voltar" --width=500 --height=400 
		else
			echo "Nenhum erro foi encontrado!" | zenity --text-info --title "Sanity" --window-icon=$iconpath --ok-label "Voltar" --width=500 --height=400 
		fi
	fi
;;  

      "Realizar teste novamente" )
		./main.sh | zenity --progress --pulsate --text="Aguarde um instante. Estamos realizando os testes..." --no-cancel --ok-label "Finalizado!"

;;  

	"Data da última checagem" )
       cat $sanity.date.txt | zenity --list --title "Sanity" --window-icon=$iconpath --text " Abaixo está a data do último teste realizado pelo Sanity:\n" --column "Data"  --width=500 --height=400 --ok-label "Voltar"
;; 

		"Lista de softwares padrão" )
       cat soft.txt | zenity --list --title "Sanity" --window-icon=$iconpath --text " \n" --column "Função"  --column "Programa"  --width=500 --height=400 --ok-label "Voltar"

;;
      "Reportar erro ao servidor" )
	if [ ! -e $sanity ]; then
		zenity --warning --text="Por favor, realize uma nova checagem !"
	else	
		date >> $sanity.msg.txt	
		whoami >> $sanity.msg.txt       
		zenity --title "Sanity" --checkbox="Eu tenho ciência da informação que enviarei e assumo todos os meus atos." --text-info --window-icon=$iconpath --editable --ok-label "Enviar" --width=700 --height=500 >> $sanity.msg.txt	   
		if [ $? -eq 0 ]; then 					
			# Comando para enviar o texto			
			zenity --info --text "Sua mensagem foi enviada com sucesso!" --title "Sucesso!"
		fi
		rm $sanity.msg.txt
fi
;;  

		"Sobre" )
       cat README.md | zenity --text-info --title "	Sobre" --window-icon=$iconpath --ok-label "Voltar" --width=500 --height=400 
;; 
   
  *)
		echo "Obrigado por utilizar o Sanity :)"          
		break
          ;;
        esac
  
done

else 
	exit
fi

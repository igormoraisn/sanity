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


if [ -e ~/.sanity/.logs/.dev.txt ]; then
	dev="!!"
fi

if [ -e $zenity ]; then
# Criando notificação no início do programa
zenity --notification --window-icon=$iconpath --text "	Bem vindo !" --timeout=7


while true; do
  choice="$(zenity --width=500 --height=480 --list --window-icon=$iconpath --ok-label "Abrir" --cancel-label "Sair" --column "					Menu" --title="Sanity" \
  "Rede" \
  "Compiladores												$dev" \
  "IDE" \
  "Utilitários(Browsers, editores)" \
  "Office" \
  "Bibliotecas do Sistema" \
  "Realizar teste novamente" \
  "Data da última checagem" \
  "Lista de softwares padrão" \
  "Reportar erro ao servidor" \
  "Sobre" \
  "Sair")"

  case "${choice}" in
     "Rede" )  
       cat $log.rede.txt | zenity --list --title "Sanity" --window-icon=$iconpath --text " Abaixo está listado se há conectividade:\n" --column "Interface de Rede" --column "Ativa?" --width=500 --height=400 --ok-label "Voltar" --cancel-label "Ver Erros"
	if [ $? -eq 1 ]; then
		cat README.md | zenity --text-info --title "	Sobre" --window-icon=$iconpath --ok-label "Voltar" --width=500 --height=400 
	fi
;;
      "Compiladores												$dev" )
       cat $log.dev.txt | zenity --list --title "Sanity" --window-icon=$iconpath --text " Abaixo estão listados as informações sobre os compiladores ativos:\n" --column "Compiladores" --column "Funciona?" --width=500 --height=400 --ok-label "Voltar" --cancel-label "Ver Erros"
	if [ $? -eq 1 ]; then
		cat README.md | zenity --text-info --title "	Sobre" --window-icon=$iconpath --ok-label "Voltar" --width=500 --height=400 
	fi
;;  

      "IDE" )
       cat $log.ide.txt | zenity --list --title "Sanity" --window-icon=$iconpath --text " Abaixo estão listados as informações sobre as IDE's ativas:\n" --column "Ambiente de Desenvolvimento Integrado" --column "Ativo?" --width=500 --height=400 --ok-label "Voltar" --cancel-label "Ver Erros"
	if [ $? -eq 1 ]; then
		cat README.md | zenity --text-info --title "	Sobre" --window-icon=$iconpath --ok-label "Voltar" --width=500 --height=400 
	fi

;;

      "Utilitários(Browsers, editores)" )
      cat $log.util.txt | zenity --list --title "Sanity" --window-icon=$iconpath --text " Abaixo estão listados as informações sobre os utilitários:\n" --column "Utilitários"  --column "Funciona?" --width=500 --height=400 --ok-label "Voltar" --cancel-label "Ver Erros"
	if [ $? -eq 1 ]; then
		cat README.md | zenity --text-info --title "	Sobre" --window-icon=$iconpath --ok-label "Voltar" --width=500 --height=400 
	fi
;;  
      "Office" )
       cat $log.office.txt | zenity --list --title "Sanity" --window-icon=$iconpath --text " Abaixo estão listados as informações sobre o LibreOffice:\n" --column "Pacote Office" --column "Em funcionamento?" --width=500 --height=400 --ok-label "Voltar" --cancel-label "Ver Erros"
	if [ $? -eq 1 ]; then
		cat README.md | zenity --text-info --title "	Sobre" --window-icon=$iconpath --ok-label "Voltar" --width=500 --height=400 
	fi
;;  

		"Bibliotecas do Sistema" )
       cat $log.lib.txt | zenity --list --title "Sanity" --window-icon=$iconpath --text " Abaixo estão listados informações sobre as principais bibliotecas:\n" --column "Bibliotecas do Sistema" --column "Ativa?"  --width=500 --height=400 --ok-label "Voltar" --cancel-label "Ver Erros"
	if [ $? -eq 1 ]; then
		cat README.md | zenity --text-info --title "	Sobre" --window-icon=$iconpath --ok-label "Voltar" --width=500 --height=400 
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
		#zenity  --question --title "Alert"  --text "Microsoft Windows has been found! Would you like to remove it?"	   
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

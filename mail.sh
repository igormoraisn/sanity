#!/bin/bash

# Módulo de envio de relatos

msg=~/.sanity/msg.txt

zenity --text-info --title="Relatar erro" --editable --cancel-label="Voltar" --ok-label="Enviar" --checkbox="Eu tenho plena ciência das informações que estou enviando." > $msg
if [ $? -eq 0 ]; then
	echo "" >> $msg
	whoami >> $msg
	zenity --info --title="Relatar erro" --text="O problema foi relatado com sucesso!"
fi

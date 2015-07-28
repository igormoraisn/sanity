#!/usr/bin/wish

# Universidade Federal de Sergipe
# Centro de Ciências Exatas e Tecnológicas
# Departamente de Computação
# Sanity

# Módulo de interface visual para usuários comuns com base no TCL/TK

global entrada
global arquivo
global problema

set fdev "~/.sanity/.logs/.dev-error.txt"
set futil "~/.sanity/.logs/.util-error.txt"
set foffice "~/.sanity/.logs/.office-error.txt"
set flib "~/.sanity/.logs/.lib-error.txt"
set fide "~/.sanity/.logs/.ide-error.txt"
set fnet "~/.sanity/.logs/.net-error.txt"

set dev [file exists $fdev]
set util [file exists $futil]
set office [file exists $foffice]
set lib [file exists $flib]
set ide [file exists $fide]
set net [file exists $fnet]

set log "~/.sanity/.logs/"
set sanity "~/.sanity/"

if {$dev||$util||$office||$lib||$ide||$net} { 
	set problema "Você tem os seguintes problemas: \n\n"
	if {$net} {
		append problema "-Sem conexão de rede \n\n"
	}
	
	if {$dev} {
		append problema "-Ferramentas de desenvolvimento \n"
		set entrada [open $fdev]
		set arquivo [read $entrada]
		append problema $arquivo
		append problema "\n"
		
	}
	
	if {$util} {
		append problema "-Utilitários \n"
		set entrada [open $futil]
		set arquivo [read $entrada]
		append problema $arquivo
		append problema "\n"
	}

	if {$office} {
		append problema "-Office \n"
		set entrada [open $foffice]
		set arquivo [read $entrada]
		append problema $arquivo
		append problema "\n"
	}

	if {$lib} {
		append problema "-Bibliotecas \n"
		set entrada [open $flib]
		set arquivo [read $entrada]
		append problema $arquivo
		append problema "\n"
	}

	if {$ide} {
		append problema "-IDEs \n"
		set entrada [open $fide]
		set arquivo [read $entrada]
		append problema $arquivo
		append problema "\n"
	}
} else {
	set problema "\n\nA máquina não apresenta problemas\n\n"
}



label .problema -textvariable problema
button .sair -text "Sair" -command {exit}
button .refazer -text "Refazer Teste" -command {exec sh main.sh}
grid .problema -row 0 -column 0 -columnspan 3
grid .sair -row 2 -column 0
grid .refazer -row 2 -column 1
wm title . "   Sanity   "

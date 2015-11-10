#!/usr/bin/wish

# Universidade Federal de Sergipe
# Centro de Ciências Exatas e Tecnológicas
# Departamente de Computação
# Sanity

# Módulo de interface visual para usuários comuns com base no TCL/TK

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

set problema " "

proc testar {dev util office lib ide net} {
	if {$dev||$util||$office||$lib||$ide||$net} {
		set fdev "~/.sanity/.logs/.dev-error.txt"
		set futil "~/.sanity/.logs/.util-error.txt"
		set foffice "~/.sanity/.logs/.office-error.txt"
		set flib "~/.sanity/.logs/.lib-error.txt"
		set fide "~/.sanity/.logs/.ide-error.txt"
		set fnet "~/.sanity/.logs/.net-error.txt"
		set problema " "
		append problema "\n"

		if {$net} {
			append problema "-Sem conexão de rede \n\n"
		}

		if {$dev} {
			append problema " - Ferramentas de desenvolvimento \n"
			set entrada [open $fdev]
			set arquivo [read $entrada]
			append problema $arquivo
			append problema "\n"

		}

		if {$util} {
			append problema " - Utilitários \n"
			set entrada [open $futil]
			set arquivo [read $entrada]
			append problema $arquivo
			append problema "\n"
		}

		if {$office} {
			append problema " - Office \n"
			set entrada [open $foffice]
			set arquivo [read $entrada]
			append problema $arquivo
			append problema "\n"
		}

		if {$lib} {
			append problema " - Bibliotecas \n"
			set entrada [open $flib]
			set arquivo [read $entrada]
			append problema $arquivo
			append problema "\n"
		}

		if {$ide} {
			append problema " - IDEs \n"
			set entrada [open $fide]
			set arquivo [read $entrada]
			append problema $arquivo
			append problema "\n"
		}
	} else {
		exit
	}
	return $problema
}

proc sair {} {
	puts "Bye Bye :)"
	exit
}

set problema [testar $dev $util $office $lib $ide $net]

# Criando configuração de menus
menu .mbar
. configure -menu .mbar

menu .mbar.arq -tearoff 0
.mbar add cascade -menu .mbar.arq -label Arquivo -underline 0

menu .mbar.opt -tearoff 0
.mbar add cascade -menu .mbar.opt -label Opções -underline 0

menu .mbar.help -tearoff 0
.mbar add cascade -menu .mbar.help -label Ajuda -underline 0

.mbar.arq add command -label Sair -command { [ sair ] }
.mbar.opt add command -label "Relatar erro"
.mbar.opt add command -label "Refazer teste" -command {
	exec wish refazer.tcl
	set problema [testar $dev $util $office $lib $ide $net]
	.problema configure -state normal
	.problema replace 1.0 end $problema
	.problema configure -state disable
}
.mbar.help add command -label Ajuda
.mbar.help add command -label Sobre -command { exec wish sobre.tcl }


wm resizable . 0 0
set x [expr {([winfo screenwidth .] - 520)/2}]
set y [expr {([winfo screenheight .] - 310)/2}]
wm title . "Sanity"

label .titulo -text "\nForam encontrados os seguintes problemas:"
frame .borda 
scrollbar .scroll -command ".problema yview" -orient v

text .problema -borderwidth 0 -yscrollcommand ".scroll set" -height 17 -width 71 -background gray86
.problema insert end $problema
.problema configure -state disable

button .ajuda -text "Ajuda" -command { exec wish ajuda.tcl }
button .refazer -text "Refazer Teste" -command {
	exec wish refazer.tcl
	set problema [testar $dev $util $office $lib $ide $net]
	.problema configure -state normal
	.problema replace 1.0 end $problema
	.problema configure -state disable
}

pack .titulo -anchor nw
grid .problema -in .borda -row 2 -column 1
grid .scroll -in .borda -row 2 -column 2 -sticky ns
pack .borda 
#pack .ajuda -padx 1 -pady 1 -side right
#pack .refazer -padx 1 -pady 1 -side right
wm geometry . 520x276+$x+$y

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

set problema [testar $dev $util $office $lib $ide $net]

wm resizable . 0 0
set x [expr {([winfo screenwidth .] - 520)/2}]
set y [expr {([winfo screenheight .] - 310)/2}]
wm title . "Sanity"

label .titulo -text "\nForam encontrados os seguintes problemas:"
frame .borda
scrollbar .scroll -command ".problema yview" -orient v

text .problema -borderwidth 2 -yscrollcommand ".scroll set" -height 17 -width 71
.problema insert end $problema

button .sair -text "Sair" -command {exit}
button .refazer -text "Refazer Teste" -command {
	exec wish refazer.tcl
	set problema [testar $dev $util $office $lib $ide $net]
	.problema replace 1.0 end $problema
}

pack .titulo -anchor nw
grid .problema -in .borda -row 2 -column 1
grid .scroll -in .borda -row 2 -column 2 -sticky ns
pack .borda
pack .sair -padx 1 -pady 1 -side right
pack .refazer -padx 1 -pady 1 -side right
wm geometry . 520x310+$x+$y

#!/usr/bin/wish

# Universidade Federal de Sergipe
# Centro de Ciências Exatas e Tecnológicas
# Departamente de Computação
# Sanity

# Módulo de interface visual para usuários comuns com base no TCL/TK

# Esta janela e temporaria apenas para testes na construçao da principal
wm resizable . 0 0
set x [expr {([winfo screenwidth .] - 520)/2}]
set y [expr {([winfo screenheight .] - 310)/2}]
wm title . "Sobre"

set problema "Foi criado por bla bla bla para manutençao de maquinas do DCOMP \n bla bla bla \n \n\n Apenas uma visão de teste é isso aê"

label .titulo -text "\nMódulo de sanidade bla bla bla"
frame .borda
scrollbar .scroll -command ".problema yview" -orient v

text .problema -borderwidth 2 -yscrollcommand ".scroll set" -height 19 -width 71
.problema insert end $problema
.problema configure -state disable

pack .titulo -anchor nw
grid .problema -in .borda -row 2 -column 1
grid .scroll -in .borda -row 2 -column 2 -sticky ns
pack .borda
wm geometry . 520x310+$x+$y

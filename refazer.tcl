#!/usr/bin/wish

# Universidade Federal de Sergipe
# Centro de Ciências Exatas e Tecnológicas
# Departamente de Computação
# Sanity

# Módulo de interface visual para usuários comuns com base no TCL/TK


wm title . "   Refazendo testes...   "
label .problema -text "Aguarde ..."
button .refazer -text refaz -command {exec sh main.sh}
pack .problema
pack [ttk::progressbar .p1 -orient horizontal -length 200 -mode indeterminate]
.p1 start
after 10000 { 
	#exec sh main.sh
	exit }


#!/usr/bin/wish

# Universidade Federal de Sergipe
# Centro de Ciências Exatas e Tecnológicas
# Departamente de Computação
# Sanity

# Módulo de interface visual para usuários comuns com base no TCL/TK


proc main { } {
	if {[file isdirectory "~/.sanity"]==0} {
		exec mkdir ~/.sanity
	}
	if {[file isdirectory "~/.sanity/.src"]==0} {
		exec mkdir ~/.sanity/.src
	}
	if {[file isdirectory "~/.sanity/.logs"]==0} {
		exec mkdir ~/.sanity/.logs
	}
	if {[file exists "~/.sanity/.date.txt"]==1} {
		exec rm ~/.sanity/.date.txt
	}
	exec date >> ~/.sanity/.date.txt
	
	set host [info hostname]
	set log "~/.sanity/"
	append log $host
	append log ".txt"
	set dump "~/.sanity/.dump.txt"
	
	catch {exec ./network.sh}
	catch {exec ./devel.sh}
	catch {exec ./lib.sh}
	catch {exec ./office.sh}
	catch {exec ./ide.sh}
	catch {exec ./utility.sh}
	catch {exec ./select.sh}
}

set teste(1) "./network.sh"
set teste(2) "./devel.sh"
set teste(3) "./lib.sh"
set teste(4) "./office.sh"
set teste(5) "./ide.sh"
set teste(6) "./utility.sh"
set teste(7) "./select.sh"
	
set nome(1) "Testando Rede"
set nome(2) "Testando Ferramentas"
set nome(3) "Testando Bibliotecas"
set nome(4) "Testando Office"
set nome(5) "Testando IDEs"
set nome(6) "Testando Utilitários"
set nome(7) "Finalizando testes"
set a 0
set aguarde "Iniciando..."
wm title . "   Refazendo testes...   "
label .problema -textvariable aguarde
pack .problema
pack [ttk::progressbar .p1 -orient horizontal -length 200 -mode determinate -value 0]

after 100 { 
	#catch {exec ./main.sh}
	#main
	if {[file isdirectory "~/.sanity"]==0} {
		exec mkdir ~/.sanity
	}
	if {[file isdirectory "~/.sanity/.src"]==0} {
		exec mkdir ~/.sanity/.src
	}
	if {[file isdirectory "~/.sanity/.logs"]==0} {
		exec mkdir ~/.sanity/.logs
	}
	if {[file exists "~/.sanity/.date.txt"]==1} {
		catch {exec rm ~/.sanity/.date.txt}
	}
	exec date >> ~/.sanity/.date.txt
	
	set host [info hostname]
	set log "~/.sanity/"
	append log $host
	append log ".txt"
	set dump "~/.sanity/.dump.txt"
	
	set tamanho [array size teste]
	incr tamanho
	set valor 0
	for {set i 1} {$i< $tamanho} {incr i} {
		set valor [expr $valor+14]
		puts $valor
		.p1 step 14
		catch {exec $teste($i)}
		puts $aguarde
		set aguarde $nome($i)
		puts $aguarde
	}
	set aguarde "Acabou"
	exit
}


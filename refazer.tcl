#!/usr/bin/wish

# Universidade Federal de Sergipe
# Centro de Ciências Exatas e Tecnológicas
# Departamente de Computação
# Sanity

# Módulo de interface visual para usuários comuns com base no TCL/TK

proc checa_logs {log} {
	set end "~/.sanity/.logs/"
	append end $log
	if {[file exists $end]} { file delete $end }
}

set teste(1) "modules/network"
set teste(2) "modules/development"
set teste(3) "modules/office"
set teste(4) "modules/ide"
set teste(5) "modules/utility"
set teste(6) "modules/library"
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
	checa_logs .dev.txt
	checa_logs .dev-error.txt
	checa_logs .ide.txt
	checa_logs .ide-error.txt
	checa_logs .lib.txt
	checa_logs .lib-error.txt
	checa_logs .net.txt
	checa_logs .net-error.txt
	checa_logs .office.txt
	checa_logs .office-error.txt
	checa_logs .util.txt
	checa_logs .util-error.txt

	exec date >> ~/.sanity/.date.txt
	set host [info hostname]
	set log "~/.sanity/"
	append log $host
	append log ".txt"

	checa_logs $host.txt

	set dump "~/.sanity/.dump.txt"

	set tamanho [array size teste]
	set valor 0
	for {set i 1} {$i< $tamanho} {incr i} {
		set valor [expr $valor+14]
		.p1 step 14
		#catch {exec $teste($i)}
		puts $aguarde
		puts $valor
		catch { exec run-parts --regex .sh $teste($i) }
		set aguarde $nome($i)
	}
	exec $teste($i)
	set aguarde "Acabou"
	exit
}

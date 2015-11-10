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

set nome(1) "Testando Rede..."
set nome(2) "Testando Ferramentas..."
set nome(3) "Testando Bibliotecas..."
set nome(4) "Testando Office..."
set nome(5) "Testando IDEs..."
set nome(6) "Testando Utilitários..."
set nome(7) "Finalizando testes..."

set aguarde "Iniciando..."


wm resizable . 0 0
set x [expr {([winfo screenwidth .] - 210)/2}]
set y [expr {([winfo screenheight .] - 35)/2}]
wm title . "Testando"
label .problema -textvariable aguarde
pack .problema
pack [ttk::progressbar .p1 -orient horizontal -length 200 -mode determinate -value 0]
wm geometry . 210x35+$x+$y

after 100 {

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

	set tamanho [array size teste]

	for {set i 1} {$i< $tamanho} {incr i} {
		.p1 step 14
		set aguarde $nome($i)
		update
		catch { exec run-parts --regex .sh $teste($i) }
	}
	exec $teste($i)
	exit
}

#!/bin/bash

# GHC

# Testando o compilador para Haskell GHC e o seu interpretador

ghc_path=/usr/bin/ghc
ghci_path=/usr/bin/ghci
code_ghc_name=ghc.hs
log=~/.sanity/.logs/.dev.txt
error=~/.sanity/.logs/.dev-error.txt
source=~/.sanity/.src
path=/opt/sanity

echo "Ghc" >> $log

if [ -e $ghc_path ]; then
	cd $path/src	
	tmp=$path/tmp
	cp $code_ghc_name $source	
	cd $source	
	ghc --make $code_ghc_name	
	./ghc
	rm $code_ghc_name		
	if  diff $source/haskell.txt $tmp/ghc_sample.txt ; then
		echo "Sim" >> $log
	else
		echo "Não" >> $log
		echo "# GHC - erro na compilação/execução de ghc.hs" >> $error	
	fi
	rm $source/haskell.txt
else
	echo "# GHC - O compilador GHC não está instalado." >> $error
	echo "Não" >> $log
fi

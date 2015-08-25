#!/bin/bash

# JDK

jdk_path=/usr/lib/jvm
log=~/.sanity/.logs/.dev.txt
error=~/.sanity/.logs/.dev-error.txt
path=/opt/sanity
source=~/.sanity/.src
# Testando a existência do diretório Java

echo "Jdk" >> $log	

if [ -e $jdk_path ]; then

# Comandos de compilação
	tmp=$path/tmp		
	cd $path/src	
	javac -d $source Java.java
	cd $source	
	java Java
# Comparando a saída do programa		
	if  diff $source/java.txt $tmp/jdk_sample.txt ; then
		echo "Sim" >> $log
	else
		echo "Não" >> $log
		echo "# JDK - erro na compilação/execução de Java.java" >> $error	
	fi
	rm $source/java.txt
else
	echo "# JDK - O compilador JDK não está instalado." >> $error
	echo "Não" >> $log
fi

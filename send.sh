#!/bin/bash

# Módulo para o envio de log por meio de netcat (stdout)

hostname=$(hostname)

# O servidor irá deixar o conteúdo do log até que haja uma conexão
nc -vvn -l -p 3000 < ~/.sanity/$hostname.txt

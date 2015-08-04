#!/bin/bash

hostname=$(hostname)

nc -vvn -l -p 3000 -w 10 < ~/.sanity/$hostname.txt

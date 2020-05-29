#!/bin/bash

echo ""

# Verifica se existe o speedtest-cli instalado
check=$(command -v speedtest-cli)

# Se não estiver instalado
if [[ "$check" == "" ]]; then
	echo "[Erro] É necessário instalar o speedtest-cli para utilizar este script"
	sleep 1
	echo "Tente: sudo apt install speedtest-cli"
	echo ""
	exit 1
fi

# Se o usuário não passar exatamente um argumento
if [[ $# != 1 ]]; then
	echo "[Erro] É necessário passar um intervalo entre os testes"
	sleep 1
	echo "Exemplos:"
	echo "	$0 10s"
	echo "	$0 5m"
	echo "	$0 1h"
	echo ""
	exit 1
fi

interv=$1

while true; do
	date "+%Y/%m/%d %H:%M:%S"
	echo "---------------------------------"
	speedtest-cli --simple
	echo "---------------------------------"
	echo ""
	echo ""
	echo ""
	sleep $interv
done

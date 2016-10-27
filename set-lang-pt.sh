#!/usr/bin/env bash

# Ficheiro para importar lang pack para o laravel 5
# **************************************************
DIR="resources/lang/pt"

if [ ! -d "${DIR}" ]; then
    echo -e "--- Criando a pasta para os ficheiros de tradução pt_PT. --- "
    mkdir -p ${DIR}
fi

echo -e "\n--- Importando do GitHub os ficheiros de tradução ---\n"
wget -P ./${DIR} https://raw.githubusercontent.com/caouecs/Laravel-lang/master/src/pt/auth.php
wget -P ./${DIR} https://raw.githubusercontent.com/caouecs/Laravel-lang/master/src/pt/pagination.php
wget -P ./${DIR} https://raw.githubusercontent.com/caouecs/Laravel-lang/master/src/pt/passwords.php
wget -P ./${DIR} https://raw.githubusercontent.com/caouecs/Laravel-lang/master/src/pt/validation.php

echo -e "\n--- Importação de ficheiros de tradução finalizada ! ---\n"
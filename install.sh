#!/usr/bin/env bash

#********************************************************* *#
# Script criado em 24/10/2016
# Por: Giovani Oliveira
#***********************************************************#
# Instala todos os scripts necessários para facilitar o
# desenvolvimento de sites/aplicações web no sistema Linux,
# baseados em Laravel / Wordpress / Bootstrap.
# **********************************************************#

# Inicia o sudo para os comandos #
sudo -v

echo "---- Iniciando instalacao do ambiente de Desenvolvimento PHP ---"

echo "--- Atualizando lista de pacotes ---"
sudo apt-get update

echo "--- Definindo Senha padrao para o MySQL e suas ferramentas ---"

DEFAULTPASS="savage"

sudo debconf-set-selections <<EOF
mysql-server    mysql-server/root_password password $DEFAULTPASS
mysql-server    mysql-server/root_password_again password $DEFAULTPASS
dbconfig-common dbconfig-common/mysql/app-pass password $DEFAULTPASS
dbconfig-common dbconfig-common/mysql/admin-pass password $DEFAULTPASS
dbconfig-common dbconfig-common/password-confirm password $DEFAULTPASS
dbconfig-common dbconfig-common/app-password-confirm password $DEFAULTPASS
phpmyadmin      phpmyadmin/reconfigure-webserver multiselect apache2
phpmyadmin      phpmyadmin/dbconfig-install boolean true
phpmyadmin      phpmyadmin/app-password-confirm password $DEFAULTPASS
phpmyadmin      phpmyadmin/mysql/admin-pass     password $DEFAULTPASS
phpmyadmin      phpmyadmin/password-confirm     password $DEFAULTPASS
phpmyadmin      phpmyadmin/setup-password       password $DEFAULTPASS
phpmyadmin      phpmyadmin/mysql/app-pass       password $DEFAULTPASS
EOF

echo "--- Instalando pacotes basicos ---"
sudo apt-get install vim curl software-properties-common git gdebi synaptic--assume-yes --force-yes

echo "--- Instalando MySQL, Phpmyadmin e alguns outros modulos ---"
sudo apt-get install mysql-server-5.7 mysql-client-5.7 mysql-workbench phpmyadmin --assume-yes --force-yes

echo "--- Instalando PHP, Apache e alguns modulos ---"
sudo apt-get install apache2 php7.0 libapache2-mod-php7.0 php7.0-curl php7.0-gd php7.0-mcrypt php7.0-cli php7.0-json php7.0-bmstring php7.0-opcache php7.0-xml php7.0-zip  php7.0-mysql --assume-yes --force-yes

echo "--- Habilitando mod-rewrite do Apache ---"
sudo a2enmod rewrite

echo "--- Reiniciando Apache ---"
sudo service apache2 restart

echo "--- Baixando e Instalando Composer ---"
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

# echo "--- Instalando Banco NoSQL -> Redis <- ---"
# sudo apt-get install redis-server --assume-yes
# sudo apt-get install php-redis

echo "--- Adicionando repositorio do pacote PHP 5.6 ---"
sudo add-apt-repository ppa:webupd8team/java

echo "--- Atualizando lista de pacotes ---"
sudo apt-get update

echo "--- Instalando o Java8 ---"
sudo apt-get install oracle-java8-installer

# Move os templates de virtual hosts para a pasta de configuração do Apache2. #
echo -e "\n--- Movendo os ficheiros de configuração para a pasta do Apache2 --- "
sudo mv template /etc/apache2/sites-available
sudo mv template-l5 /etc/apache2/sites-available
sudo mv 000-default.conf /etc/apache2/sites-available
sudo mv apache2.conf /etc/apache2
sudo mv envvars /etc/apache2

# Instala os scripts para criar os projectos. #
echo -e "\n--- Movendo os scripts para a pasta /usr/local/bin --- "
sudo chmod 755 mysql-backup |sudo mv mysql-backup /usr/local/bin
sudo chmod 755 projecto |sudo mv projecto /usr/local/bin
sudo chmod 755 projecto-remove |sudo mv projecto-remove /usr/local/bin

# Instale apartir daqui o que você desejar
echo -e "\n--- Criando a pasta ~/Sites --- "
[ ! -d Sites ] && mkdir -p Sites

echo "[OK] --- Ambiente de desenvolvimento concluido ---"
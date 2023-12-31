#!/bin/bash

# SCRIPT CRIADO EM 2023-04-26 UTILIZANDO

# UBUNTU >= 20.04
# Mint >= 21 Mate
# Django 4.2
# python 3

# cv2 3.4.18.65 - precisa alterar código para usar 4.7:
# pip uninstall opencv-python
# pip install opencv-python
# repassar todos as ocorrencias de findContours:
#(_, contours, _) = cv2.findContours(
#(contours, _) = cv2.findContours(

# e vários outros de requirements-titan256GB.txt

# rodar esse script como sudo: sudo su

# fazer download do arquivo de configuração
# wget https://raw.githubusercontent.com/fzampirolli/mctest/master/_setup-all.sh

# Instala o python3
sudo apt update && sudo apt upgrade -y
sudo apt install -y python3
sudo apt install -y python3-dev
sudo apt install -y python3-pip
sudo apt install -y idle3
sudo apt install -y default-libmysqlclient-dev
sudo apt install -y build-essential

# instala mais alguns pacotes com apt
#sudo snap install emacs --classic
sudo apt install -y textlive-full
sudo apt install -y texlive-extra-utils
sudo apt install -y texlive-pictures
sudo apt install -y texlive-font-utils
sudo apt install -y texlive-latex-extra
sudo apt install -y texlive-lang-portuguese
sudo apt install -y zbar-tools
sudo apt install -y texlive-science
sudo apt install -y libzbar-dev
sudo texhash

# se ainda nao fez download:
sudo apt install -y git

# Instala o MySQL
sudo apt install -y mysql-server
#sudo mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '$DB_PASS';"

# Atualiza a lista de pacotes
sudo apt-get update

# Instala o pacote mysql-client-core-8.0
sudo apt install -y mysql-client-core-8.0

# Instala e entra em virtualenv
sudo apt install -y virtualenv
virtualenv -p python3 PycharmProjects
cd /home/joao/PycharmProjects/
#git clone https://github.com/fzampirolli/mctest.git
git clone https://github.com/fzampirolli/mctest/tree/b4b55516bc78c4df25b5a659af31f948affa2c1d

cd mctest

mkdir tmp
mkdir tmp/imgs180days
mkdir tmpGAB
mkdir pdfExam
mkdir pdfQuestion
mkdir pdfTopic
mkdir pdfStudentEmail
mkdir /backup
mkdir /backup/json
mkdir /backup/mysql
mkdir /backup/tmpGAB

source /home/joao/PycharmProjects/bin/activate

pip install -r requirements.txt

pip install --upgrade pip setuptools

pip install django==4.2
pip install python-dotenv
pip install django-import-export
pip install django-widget-tweaks
pip install django-extensions
pip install django-import-export
pip install scikit-image==0.20.0
pip install django-widget-tweaks
pip install django-extensions
pip install django-import-export
pip install mysqlclient
pip install bcrypt
pip install pyqrcode
pip install matplotlib
pip install python-decouple
pip install pypdf2
pip install opencv-python==3.4.18.65
pip install img2pdf
pip install pandas
pip install pdf2image
pip install pyzbar
pip install arviz
pip install pymc3
pip install mysqlclient

pip install --upgrade pip setuptools

#backports.zoneinfo
#scikit-image
#scipy

# NÃO MUDAR O USER 'root' DO BD
cp _settings.env ../
source _settings.env

deactivate

# Inicia o serviço do MySQL
sudo systemctl start mysql

# Cria banco de dados e concede privilégios ao root
sudo mysql -u root << EOF
GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'localhost' WITH GRANT OPTION;
CREATE DATABASE $DB_NAME;
FLUSH PRIVILEGES;
exit
EOF

# Configura arquivos do mysql
sudo sed -i 's/127\.0\.0\.1/0\.0\.0\.0/g' /etc/mysql/mysql.conf.d/mysqld.cnf
sudo echo '[client]
database = '"$DB_NAME"'
user = '"$DB_USER"'
password = '"$DB_PASS"'
default-character-set = utf8' >>/etc/mysql/my.cnf

# Re-inicia o serviço do MySQL
sudo systemctl daemon-reload
sudo systemctl restart mysql

# Executa o script SQL de um banco de dados exemplo com a senha 'ufabc12345' para:
# fzampirolli@ufabc.edu.br
# fzcoord@ufabc.edu.br
# fzprof@ufabc.edu.br
# fzstudent@ufabc.edu.br
# mysqldump --no-defaults -u root -p DB_MCTest -h localhost > mctest.sql
sudo mysql -u root $DB_NAME < mctest.sql

cp crontabDjango.sh ../
cp runDjango.sh ../

#!/bin/bash
set -ex

# Ubuntu 20.04 LTS (Focal)

# (1) Prerequirement
sudo apt update && sudo apt upgrade -y

# (2) Install nginx
sudo apt install nginx libnginx-mod-http-headers-more-filter -y

# (3) Install mariadb
sudo apt install mariadb-server -y

# (4) Install php
sudo apt install php-fpm php-mysql php-mbstring php-xml php-bcmath php-gd php-imagick php-zip php-curl -y

# (5) Install utilities
sudo apt install zip unzip build-essential certbot python3-certbot-nginx -y

# (6) Copy nginx configuration file
sudo curl -o /etc/nginx/snippets/general.conf https://raw.githubusercontent.com/sz-teylon/trproject/master/general.conf \
 && sudo curl -o /etc/nginx/snippets/php-default.conf https://raw.githubusercontent.com/sz-teylon/trproject/master/php-default.conf \
 && sudo curl -o /etc/nginx/snippets/ssl.conf https://raw.githubusercontent.com/sz-teylon/trproject/master/ssl.conf \
 && sudo curl -o /etc/nginx/sites-available/website.conf https://raw.githubusercontent.com/sz-teylon/trproject/master/website.conf \
 && sudo curl -o /etc/nginx/ssl-dhparams.pem https://ssl-config.mozilla.org/ffdhe2048.txt
 

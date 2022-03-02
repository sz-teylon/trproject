#!/bin/bash
printf "\nsetup nginx\n"
sudo apt update && sudo apt install curl gnupg2 ca-certificates lsb-release ubuntu-keyring -y
curl https://nginx.org/keys/nginx_signing.key | gpg --dearmor \
  | sudo tee /usr/share/keyrings/nginx-archive-keyring.gpg >/dev/null
    
gpg --dry-run --quiet --import --import-options import-show /usr/share/keyrings/nginx-archive-keyring.gpg

read -p "Are you sure? " -n 1 -r
printf "\n"
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
  exit 1
fi
  
echo "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] \
http://nginx.org/packages/ubuntu `lsb_release -cs` nginx" \
  | sudo tee /etc/apt/sources.list.d/nginx.list
  
echo -e "Package: *\nPin: origin nginx.org\nPin: release o=nginx\nPin-Priority: 900\n" \
  | sudo tee /etc/apt/preferences.d/99nginx
    
sudo apt update && sudo apt install nginx -y

printf "\nsetup phpx\n"
sudo apt-get install -y software-properties-common \
  && sudo add-apt-repository ppa:ondrej/php \
  && sudo apt-get update \
  && sudo apt install php7.4-fpm php7.4-mysql php7.4-mbstring php7.4-gd  php7.4-curl php7.4-xml php7.4-bcmath php7.4-zip -y

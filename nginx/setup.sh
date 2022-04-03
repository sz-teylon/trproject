#!/bin/bash
set -ex

# Required package
sudo apt update && sudo DEBIAN_FRONTEND=noninteractive apt-get install -yq curl gnupg2 ca-certificates lsb-release ubuntu-keyring

# nginx ubuntu package ( http://nginx.org/en/linux_packages.html#Ubuntu )
printf "\nsetup nginx\n"
curl https://nginx.org/keys/nginx_signing.key | gpg --dearmor \
  | sudo tee /usr/share/keyrings/nginx-archive-keyring.gpg >/dev/null
    
gpg --dry-run --quiet --import --import-options import-show /usr/share/keyrings/nginx-archive-keyring.gpg
printf "\n"

echo "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] \
http://nginx.org/packages/ubuntu `lsb_release -cs` nginx" \
  | sudo tee /etc/apt/sources.list.d/nginx.list
  
echo -e "Package: *\nPin: origin nginx.org\nPin: release o=nginx\nPin-Priority: 900\n" \
  | sudo tee /etc/apt/preferences.d/99nginx

# Install nginx package
sudo apt update && sudo apt install nginx -y

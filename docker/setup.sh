#!/bin/bash
set -ex

### Install docker
# Ref: https://docs.docker.com/engine/install/ubuntu/
echo "Install docker"
# Remove old
sudo apt-get remove -yq docker docker-engine docker.io containerd runc

# Required package
sudo apt-get update && \
sudo DEBIAN_FRONTEND=noninteractive apt-get install -yq ca-certificates curl gnupg lsb-release

# Add Docker’s official GPG key:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Set up the stable repository
echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install docker
sudo apt-get update && sudo apt-get install -yq docker-ce docker-ce-cli containerd.io


### Install docker compose
# Ref: https://docs.docker.com/compose/install/
echo "Install docker compose"
# Download the current stable release of Docker Compose: (1.29.2)
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Apply executable permissions to the binary:
sudo chmod +x /usr/local/bin/docker-compose

# check version
echo "# check version"
echo "docker --version"
echo "docker-compose --version"

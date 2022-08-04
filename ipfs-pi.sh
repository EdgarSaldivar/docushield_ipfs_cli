#!/bin/bash

sudo apt-get install curl gnupg ca-certificates lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-pluginsudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-pluginlinux/ubuntu   $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin docker-compose
wget https://raw.githubusercontent.com/EdgarSaldivar/docushield_ipfs_cli/main/docker-compose.yaml 
sudo docker-compose up -d
/bin/sh -c "echo '/key/swarm/psk/1.0.0/\n/base16/\n52851b6e315ab5dadfe2fb70a7a22ff5f71b37a1c20b52760ce43a1ecbf3fdf6' > /mnt/storage/docushield/data/ipfs/swarm.key"
sudo docker-compose exec docushield ipfs bootstrap rm all 
sudo docker-compose exec docushield ipfs bootstrap add /ip4/18.144.165.94/tcp/4001/p2p/12D3KooWPXYoBXU5RFYRnhGpnDycW1FZM7hHQehdZjux96nVhQmu
sudo docker-compose exec docushield ipfs daemon 

# :)

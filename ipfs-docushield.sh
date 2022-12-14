#!/bin/bash

sudo apt-get -y install curl gnupg ca-certificates lsb-release
sudo apt-get update
sudo apt-get -y install docker docker-compose
wget https://raw.githubusercontent.com/EdgarSaldivar/docushield_ipfs_cli/main/docker-compose.yaml 
sudo docker-compose up -d
/bin/sh -c "echo '/key/swarm/psk/1.0.0/\n/base16/\n52851b6e315ab5dadfe2fb70a7a22ff5f71b37a1c20b52760ce43a1ecbf3fdf6' > /mnt/storage/docushield/data/ipfs/swarm.key"
sudo docker-compose exec docushield killall ipfs
sudo docker-compose exec docushield rm /ipfs/repo.lock
sudo docker-compose exec docushield ipfs daemon
sudo docker-compose exec docushield ipfs bootstrap rm all
sudo docker-compose exec docushield ipfs bootstrap add /ip4/18.144.165.94/tcp/4001/p2p/12D3KooWPXYoBXU5RFYRnhGpnDycW1FZM7hHQehdZjux96nVhQmu
sudo docker-compose restart docushield
sudo docker-compose exec docushield ipfs id

# :)

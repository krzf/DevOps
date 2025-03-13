#!/bin/bash
sudo apt-get update
sudo apt-get install -y docker.io

sudo systemctl enable docker.service
sudo systemctl enable containerd.service

JOIN_TOKEN=$(cat /vagrant/token.txt)
docker swarm join --token "$JOIN_TOKEN" 192.168.50.10:2377
#!/bin/bash

sudo apt-get update
sudo apt-get install -y docker.io
sudo usermod -aG docker "$USER"

sudo systemctl enable docker.service
sudo systemctl enable containerd.service

docker swarm init --advertise-addr 192.168.50.10

SWARM_TOKEN=$(docker swarm join-token -q worker)
echo "$SWARM_TOKEN" > /vagrant/token.txt

MANAGER_TOKEN=$(docker swarm join-token -q manager)
echo "$MANAGER_TOKEN" > /vagrant/manager_token.txt


#! /bin/bash

gsed -i "s/HTTP_PROXY_ADDRESS/$1/g" http-proxy.conf
gsed -i "s/PORT/$2/g" http-proxy.conf

# # Install Docker
apt-get update

apt-get install -y docker.io docker-compose

# Make a Directory

mkdir -p /etc/systemd/system/docker.service.d

cp http-proxy.conf /etc/systemd/system/docker.service.d/http-proxy.conf

systemctl daemon-reload
systemctl restart docker
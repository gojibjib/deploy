#!/usr/bin/env bash

# Update system
sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get -y \
    -o DPkg::options::="--force-confdef" \
    -o DPkg::options::="--force-confold" \
    upgrade

# Add user to docker group
sudo usermod -aG docker ubuntu

# Install  Salt dependencies
sudo apt-get install -y python python-pip vim
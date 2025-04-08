#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Update the package manager
echo "Updating package list..."
sudo apt-get update -y

# Install Nginx
echo "Installing Nginx..."
sudo apt-get install -y nginx

# Start and enable Nginx
echo "Starting and enabling Nginx service..."
sudo systemctl enable nginx
sudo systemctl start nginx

# Display installed Nginx version
echo "Verifying Nginx installation..."
nginx -v

# Success message
echo "Nginx is installed and running."

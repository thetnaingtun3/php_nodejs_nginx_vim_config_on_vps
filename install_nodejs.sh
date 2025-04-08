#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Update the package manager
echo "Updating package list..."
sudo apt-get update -y

# Add Node.js repository and install Node.js 20
echo "Adding Node.js 20 repository..."
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo bash -

echo "Installing Node.js 20..."
sudo apt-get install -y nodejs

# Install Yarn
echo "Installing Yarn..."
sudo npm install -g yarn

# Display installed Node.js version
echo "Verifying Node.js and Yarn installations..."
node -v
yarn -v

# Success message
echo "Node.js 20 and Yarn are installed successfully."

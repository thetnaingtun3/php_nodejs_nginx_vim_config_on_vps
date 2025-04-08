#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "Starting the setup process..."

# Call the install_php.sh script
echo "Installing PHP..."
bash install_php.sh

# Call the install_nodejs.sh script
echo "Installing Node.js..."
bash install_nodejs.sh

# Call the install_nginx.sh script
echo "Installing Nginx..."
bash install_nginx.sh

# Completion message
echo "Setup completed! PHP, Node.js, and Nginx are installed and running."

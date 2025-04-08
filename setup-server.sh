#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Update the package manager
echo "Updating package list..."
sudo apt-get update -y

# Install prerequisites
echo "Installing prerequisites..."
sudo apt-get install -y software-properties-common curl gnupg2 lsb-release

# Add PHP repository
echo "Adding PHP repository..."
sudo add-apt-repository ppa:ondrej/php -y

# Prompt for PHP version
echo "Available PHP versions:"
echo "8.0, 8.1, 8.2"
read -p "Enter the PHP version you want to install (e.g., 8.2): " php_version

# Validate PHP version input
if [[ ! "$php_version" =~ ^8\.[0-2]$ ]]; then
	echo "Invalid PHP version. Please run the script again and enter a valid version."
	exit 1
fi

# Install PHP and modules
echo "Installing PHP $php_version..."
#sudo apt-get install -y php$php_version php$php_version-fpm php$php_version-cli php$php_version-mysql php$php_version-curl php$php_version-xml


sudo apt install -y \
    php$php_version php$php_version-cli php$php_version-common php$php_version-curl \
    php$php_version-gd php$php_version-intl php$php_version-mbstring php$php_version-mysql \
    php$php_version-opcache php$php_version-readline php$php_version-xml php$php_version-xsl \
    php$php_version-zip php$php_version-bz2 php$php_version-fpm php$php_version-sqlite3 \
    php$php_version-imagick php$php_version-bcmath php$php_version-soap php$php_version-igbinary \
    php$php_version-redis php$php_version-memcached php$php_version-apcu php$php_version-mongodb \
    php$php_version-memcache php$php_version-pgsql php$php_version-sodium php$php_version-geoip \
    php$php_version-ldap php$php_version-swoole php$php_version-openssl

# Add Node.js repository and install Node.js 20
echo "Adding Node.js 20 repository..."
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo bash -

echo "Installing Node.js 20..."
sudo apt-get install -y nodejs

# Install Yarn
sudo npm install -g yarn

# Install Nginx
echo "Installing Nginx..."
sudo apt-get install -y nginx

# Start and enable services
echo "Starting and enabling PHP-FPM and Nginx services..."
sudo systemctl enable php$php_version-fpm
sudo systemctl enable nginx
sudo systemctl start php$php_version-fpm
sudo systemctl start nginx

# Display installed versions
echo "Verifying installations..."
php -v
node -v
nginx -v

# Success message
echo "Setup completed! PHP $php_version, Node.js 20, and Nginx are installed and running."

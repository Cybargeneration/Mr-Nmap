#!/bin/bash

# Function to install Nmap on Debian-based systems
install_nmap_debian() {
    sudo apt-get update
    sudo apt-get install -y nmap
}

# Check if Nmap is installed
if ! command -v nmap &> /dev/null
then
    echo -e "\033[0;31mNmap could not be found. Installing Nmap...\033[0m"
    
    # Install Nmap using apt-get
    install_nmap_debian
    
    echo -e "\033[0;32mNmap installed successfully.\033[0m"
else
    echo -e "\033[0;32mNmap is already installed.\033[0m"
fi

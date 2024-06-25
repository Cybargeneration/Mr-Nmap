#!/bin/bash

# Check if Nmap is installed
if ! command -v nmap &> /dev/null
then
    echo -e "\033[0;31mNmap could not be found. Installing Nmap...\033[0m"

    # Check if the system is Debian-based (apt-get)
    if command -v apt-get &> /dev/null
    then
        sudo apt-get update
        sudo apt-get install -y nmap
        echo -e "\033[0;32mNmap installed successfully using apt-get.\033[0m"
        exit
    fi

    # Check if the system is Red Hat-based (yum)
    if command -v yum &> /dev/null
    then
        sudo yum install -y nmap
        echo -e "\033[0;32mNmap installed successfully using yum.\033[0m"
        exit
    fi

    # If neither apt-get nor yum is found
    echo -e "\033[0;31mCould not detect package manager. Please install Nmap manually.\033[0m"
    exit 1
else
    echo -e "\033[0;32mNmap is already installed.\033[0m"
fi

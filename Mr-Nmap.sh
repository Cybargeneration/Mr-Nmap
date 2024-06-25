#!/bin/bash

# Color variables
GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# ASCII art title
echo -e "
${GREEN}  
  ________  ______  __________  _____________   __
  / ____/\ \/ / __ )/ ____/ __ \/ ____/ ____/ | / /
 / /      \  / __  / __/ / /_/ / / __/ __/ /  |/ / 
/ /___    / / /_/ / /___/ _, _/ /_/ / /___/ /|  /  
\____/   /_/_____/_____/_/ |_|\____/_____/_/ |_/   
                                                   
    *************************************************
    *          ${BLUE}MR-NMAP v1.1${GREEN}                         *
    *   This script is for educational purposes only*
    *     Do not use it for illegal activities!     *
    *************************************************
     Author:  Winston Ighodaro
     Tiktok:  ${BLUE}https://tiktok.com/cybergen2${GREEN}
     Website: ${BLUE}https://cybergeneration.tech${NC}
"

# Function to display menu
display_menu() {
    echo -e "${GREEN}Select an Nmap scan to perform:${NC}"
    echo -e "${GREEN}1. Ping Scan (-sP)${NC}"
    echo -e "${GREEN}2. Quick Scan (-T4)${NC}"
    echo -e "${GREEN}3. Service Version Detection (-sV)${NC}"
    echo -e "${GREEN}4. Operating System Detection (-O)${NC}"
    echo -e "${GREEN}5. Aggressive Scan (-A)${NC}"
    echo -e "${GREEN}6. UDP Scan (-sU)${NC}"
    echo -e "${GREEN}7. SYN Scan (-sS)${NC}"
    echo -e "${GREEN}8. Full TCP Scan (-sT)${NC}"
    echo -e "${GREEN}9. Top Ports Scan (--top-ports 100)${NC}"
    echo -e "${GREEN}10. Custom Scan (Specify options)${NC}"
    echo -e "${RED}11. Vulnerability Detection Scan${NC}"
    echo -e "${RED}12. Web Application Scan${NC}"
    echo -e "${GREEN}13. Intense Scan${NC}"
    echo -e "${GREEN}14. Intense Scan Plus UDP${NC}"
    echo -e "${GREEN}15. Intense Scan, All TCP Ports${NC}"
    echo -e "0. Exit"
}

# Function to perform selected Nmap scan
perform_scan() {
    case $1 in
        1) sudo nmap -sP "$ip";;
        2) sudo nmap -T4 "$ip";;
        3) sudo nmap -sV "$ip";;
        4) sudo nmap -O "$ip";;
        5) sudo nmap -A "$ip";;
        6) sudo nmap -sU "$ip";;
        7) sudo nmap -sS "$ip";;
        8) sudo nmap -sT "$ip";;
        9) sudo nmap --top-ports 100 "$ip";;
        10) read -p "Enter custom Nmap options: " custom_options
            sudo nmap $custom_options "$ip";;
        11) sudo nmap -sV --script vuln "$ip";;
        12) sudo nmap -sV --script http-enum,http-vuln* "$ip";;
        13) sudo nmap -T4 -A -v "$ip";;
        14) sudo nmap -sS -sU -T4 -A -v "$ip";;
        15) sudo nmap -p 1-65535 -T4 -A -v "$ip";;
        0) echo -e "${RED}Exiting...${NC}"; exit;;
        *) echo -e "${RED}Invalid option${NC}";;
    esac
}

# Main script
ip=""
while true; do
    read -p "Enter the IP address you want to scan (press Enter to use the previous IP address): " new_ip
    ip="${new_ip:-$ip}"
    echo ""
    display_menu
    read -p "Enter your choice (0-15): " choice
    perform_scan "$choice"
done


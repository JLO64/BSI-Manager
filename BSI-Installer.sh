#!/bin/bash

cd /tmp
LIGHTBLUE='\033[0;36m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color
printf "${LIGHTBLUE}Please enter your password to update the software on this system${NC}\n"
sudo apt update
printf "${LIGHTBLUE}Now installing BSI-Manager Python requirements${NC}\n"
sudo apt install git python3 python3-pip -y
sudo pip3 install boto3

printf "${LIGHTBLUE}Now creating BSI-Manager bin file${NC}\n"
text="#!/bin/bash \n\npython3 /usr/lib/BSI-Manager/BSI_Manager.py"
echo -e "${text}" > BSI_Manager.sh
sudo chmod +x BSI_Manager.sh
sudo rm -rf /bin/BSI_Manager
sudo mv BSI_Manager.sh /bin/BSI_Manager

printf "${LIGHTBLUE}Cloning latest BSI-Manager files from GitHub${NC}\n"
cd /usr/lib
sudo rm -rf /usr/lib/BSI-Manager
sudo git clone https://github.com/JLO64/BSI-Manager.git
sudo cp /usr/lib/BSI-Manager/System_Files/bsimanager.desktop /usr/share/applications/bsimanager.desktop
printf "\n${LIGHTBLUE}Run 'BSI_Manager' in the terminal to start the program${NC}"
sleep 15s
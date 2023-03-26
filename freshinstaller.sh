 #!/bin/bash
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${RED}*** - Script will update, upgrade, distro-update then install precoded list, Enter to continue${NC}"
read waiting
sudo apt update
echo -e "${RED}*** - Update completed, Upgrading${NC}"
sleep 2
apt upgrade -y
echo -e "${RED}*** - Upgrade complete, Dist-Upgrading${NC}"
sleep 2
apt-get dist-upgrade
echo -e "${RED}*** - Dist-Upgrade complete, apt Installing${NC}"
sleep 2
apt install htop fail2ban git tmux neofetch btop firejail -y
echo -e "${RED}*** - Installing RTL8812au drivers ***This will look like it has hung at times, Just WAIT!***${NC}"
sleep 2
apt-get install dkms
echo -e "${RED}*** - dkms complete${NC}"
apt-get install realtek-rtl88xxau-dkms -y
echo -e "${RED}*** - realtek dkms complete${NC}"
git clone https://github.com/aircrack-ng/rtl8812au.git
echo -e "${RED}*** - driver clone complete, Making${NC}"
sleep 2
cd rtl8812au
make
echo -e "${RED}*** - Installing${NC}"
make install
echo -e "${RED}*** - Installed, Cleaning up${NC}"
cd ..
rm -r rtl8812au
echo -e "${RED}*** - Script Complete?${NC}"
read waiting



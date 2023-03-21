#!/bin/bash -x
iface=$(iw dev | awk '$1=="Interface"{print $2}')
mode=$(iwconfig $iface | grep Mode | awk -F: '{print$2}' | awk '{print$1}')
echo "Using interface: $iface"
echo "Current mode: $mode"


if [[ $mode == "Managed" ]]
then
	sudo airmon-ng check kill
	sudo ip link set $iface down
	sudo iw dev $iface set type monitor
	sudo ip link set $iface up
	sudo iwconfig $iface

elif [[ $mode == "Monitor" ]]
then
        sudo  ip link set $iface down
        sudo iw dev $iface set type managed
        sudo ip link set $iface up
        sudo iwconfig $iface
	sudo service NetworkManager restart
	sudo service wpa_supplicant restart

else
  echo "Something went wrong"
sudo iwconfig $iface
fi

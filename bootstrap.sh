#!/bin/bash

# microk8s

# update OS
echo "[Bootstrap - TASK 1] Update OS"
sudo apt-get update

echo "[Bootstrap - TASK 2] Upgrade OS"
#sudo apt-get upgrade -y

# Update hosts file
# cat >>/etc/hosts<<EOF
# 192.168.100.100 k8s-master.local k8s-master
# 192.168.100.101 k8s-node1.local k8s-node1
# 192.168.100.102 k8s-node2.local k8s_node2
# 192.168.100.103 k8s-node3.local k8s-node3
# EOF

# Disable swap
echo "[Bootstrap - TASK 3] Disable and turn off SWAP"
sed -i '/swap/d' /etc/fstab
swapoff -a

echo "[Bootstrap - TASK 4] Install Core"
sudo snap install core

echo "[Bootstrap - TASK 5] Install microk8s"
sudo snap install microk8s --classic --channel=1.20/stable

# Wait for microk8s
echo "[Bootstrap - TASK 6] Wait for microk8s"
sudo microk8s status --wait-ready

# Set Root password
echo "[Bootstrap - TASK 7] Set root password"
echo -e "vagrant\nvagrant" | passwd root

# Set kubectl alias
echo "[Bootstrap - TASK 8] Set alias for microk8s kubectl => kubectl"
cat >>$home/.bash_rc<<EOF

alias kubectl='microk8s kubectl'
EOF


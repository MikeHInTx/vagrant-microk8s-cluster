#!/bin/bash

# microk8s

# Install sshpass to enable scp to work
echo "[Node - TASK 1] Installing sshpass"
apt-get  install -y sshpass 

# Join worker nodes to the microk8s cluster
echo "[Node - TASK 2] Generating script to join to microk8s cluster"
sshpass -p "vagrant" ssh -o StrictHostKeyChecking=no vagrant@k8s-master.local "sudo microk8s add-node | grep 192.168.100.100" > /tmp/join-cluster.sh

# cat /tmp/join-cluster-$host_name.sh
cat /tmp/join-cluster.sh

# Join worker nodes to the microk8s cluster
echo "[Node - TASK 3] Join node to microk8s cluster"
# sudo bash /tmp/join-cluster-$host_name.sh
sudo bash /tmp/join-cluster.sh


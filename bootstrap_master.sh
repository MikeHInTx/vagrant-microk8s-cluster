#!/bin/bash

# microk8s

# Add some services
echo "[Master - TASK 1] Add some services"
sudo microk8s enable dashboard dns registry istio

# echo "[Master - TASK 2] Generating join scripts"
# sudo microk8s add-node | grep 192.168.100.100 > /join-cluster-k8s-node1.sh
# sudo microk8s add-node | grep 192.168.100.100 > /join-cluster-k8s-node2.sh
# sudo microk8s add-node | grep 192.168.100.100 > /join-cluster-k8s-node3.sh
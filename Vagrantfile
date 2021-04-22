# -*- mode: ruby -*-
# vi: set ft=ruby :

# microk8s

#vagrant plugin install vagrant-hostmanager

ENV['VAGRANT_NO_PARALLEL'] = 'yes'

Vagrant.configure(2) do |config|
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = false
  config.hostmanager.manage_guest = true
  config.hostmanager.ignore_private_ip = false
  config.hostmanager.include_offline = false
  
  config.vm.provision "shell", path: "bootstrap.sh"

  # Kubernetes Master Server
  config.vm.define "k8s-master" do |master|
    master.vm.box = "bento/ubuntu-20.04"
    master.vm.hostname = "k8s-master.local"
    master.vm.network "private_network", ip: "192.168.100.100"
    master.vm.provider "virtualbox" do |v|
      v.name = "k8s-master"
      v.memory = 4096
      v.cpus = 2
    end
    master.vm.provision "shell", path: "bootstrap_master.sh"
  end

NodeCount=2

  # kubernetes worker nodes
  (1..NodeCount).each do |i|
    config.vm.define "k8s-node#{i}" do |node|
      node.vm.box = "bento/ubuntu-20.04"
      node.vm.hostname = "k8s-node#{i}.local"
      node.vm.network "private_network", ip: "192.168.100.10#{i}"
      node.vm.provider "virtualbox" do |v|
        v.name = "k8s-node#{i}"
        v.memory = 2048
        v.cpus = 2
      end
      node.vm.provision "shell", path: "bootstrap_node.sh"
    end
  end

end

# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # config.vm.box = "base"
  config.vm.box = "centos/7"
  config.vm.box_check_update = false
  # config.vm.network "forwarded_port", guest: 80, host: 8080
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"
  # config.vm.network "private_network", ip: "192.168.33.10"
  # config.vm.network "public_network"
  # config.vm.synced_folder "../data", "/vagrant_data"
  config.vm.synced_folder "~/Documents/bowlards", "/home/sites/bowlards",
	owner: "nginx", group: "nginx"
  #
  # config.vm.provider "virtualbox" do |vb|
  #   vb.gui = true
  #   vb.memory = "1024"
  # end

  config.vm.define :www0 do |www0|
#  	www0.vm.hostname = 'www0'
  	www0.vm.network "private_network", ip: "192.168.33.11"
	www0.vm.provider 'virtualbox' do |vb|
  		vb.name = 'www0'
		vb.memory = 2048
		vb.cpus = 2
		vb.customize [
		        "modifyvm", :id,
		        "--hwvirtex", "on",
		        "--nestedpaging", "on",
		        "--largepages", "on",
		        "--ioapic", "on",
		        "--pae", "on",
		        "--paravirtprovider", "kvm",
	        ]
	end
	www0.vm.provision :shell, :path => "provision/scripts/pkg.sh"
	www0.vm.provision :shell, :path => "provision/scripts/nginx_conf.sh"
	www0.vm.provision :shell, :path => "provision/scripts/env.sh"
#	www0.vm.provision :shell, :path => "provision/scripts/fw.sh"
	www0.vm.provision :shell, :path => "provision/scripts/mysql56.sh"
        www0.vm.provision "file", source: "provision/files/remount.sh", destination: "/home/vagrant/bin/remount.sh"
  end
#  config.vm.define :db0 do |db0|
# # 	db0.vm.hostname = 'www0'
#  	db0.vm.network "private_network", ip: "192.168.33.12"
#	db0.vm.provider 'virtualbox' do |vb|
#  		vb.name = 'db0'
#		vb.memory = 2048
#		vb.cpus = 2
#		vb.customize [
#		        "modifyvm", :id,
#		        "--hwvirtex", "on",
#		        "--nestedpaging", "on",
#		        "--largepages", "on",
#		        "--ioapic", "on",
#		        "--pae", "on",
#		        "--paravirtprovider", "kvm",
#	        ]
#	end
#	db0.vm.provision :shell, :path => "provision/scripts/pkg.sh"
##	db0.vm.provision :shell, :path => "provision/scripts/nginx_conf.sh"
#	db0.vm.provision :shell, :path => "provision/scripts/env.sh"
##	db0.vm.provision :shell, :path => "provision/scripts/fw.sh"
##	db0.vm.provision :shell, :path => "provision/scripts/remount.sh"
#  end
  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
end


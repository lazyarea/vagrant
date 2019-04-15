# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # config.vm.box = "base"
  config.vm.box = "centos/7"
  config.vm.box_check_update = false
  # config.vm.synced_folder "../data", "/vagrant_data"
  config.vm.synced_folder "c:\/Users\/kazuh\/Documents\/vagrant\/vagrant\/shared", "/home/sites", group: "nginx"
  #config.vm.synced_folder "c:\/git\/repos", "/var/www/", owner: "nginx", group: "nginx"
  #
  # config.vm.provider "virtualbox" do |vb|
  #   vb.gui = true
  #   vb.memory = "1024"
  # end

  config.vm.define :django do |django|
#  	django.vm.hostname = 'django'
	  django.vm.network "private_network", ip: "192.168.40.10"
	  django.vm.provider 'virtualbox' do |vb|
  		vb.name = 'django'
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
  	django.vm.provision :shell, :path => "provision/scripts/env.sh"
  	django.vm.provision :shell, :path => "provision/scripts/mysql56.sh"
	django.vm.provision :shell, :path => "provision/scripts/pyenv.sh"
  end
end

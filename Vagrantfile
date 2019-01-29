# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # config.vm.box = "base"
  config.vm.box = "centos/7"
  config.vm.box_check_update = false
  config.vm.synced_folder "~/Documents/project/shared", "/home/sites"

  config.vm.define :elearn do |elearn|
#  	elearn.vm.hostname = 'elearn'
  	elearn.vm.network "private_network", ip: "192.168.33.21"
	  elearn.vm.provider 'virtualbox' do |vb|
  		vb.name = 'elearn'
  		vb.memory = 1024
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
    elearn.vm.provision :shell, :path => "provision/scripts/env.sh"
    elearn.vm.provision :shell, :path => "provision/scripts/pkg7.sh"
    elearn.vm.provision :shell, :path => "provision/scripts/nginx_conf.sh"
    elearn.vm.provision :shell, :path => "provision/scripts/mysql56.sh"
    elearn.vm.provision :shell, :path => "provision/scripts/py.sh"
    elearn.vm.provision :file, source: "provision/scripts/pyenv.sh", destination: "~vagrant/pyenv.sh"
#    elearn.vm.provision :file, source: "provision/scripts/virtualenv.sh", destination: "~vagrant/virtualenv.sh"
  end
  config.vm.define :other0, autostart: false do |other0|
  	other0.vm.hostname = 'other0'
  	other0.vm.network "private_network", ip: "192.168.33.12"
#  	other0.vm.network "private_network", ip: "192.168.33.12", guest: 80, host: 81
#  	other0.vm.network "private_network", ip: "192.168.33.12", guest: 8080, host: 8081
	  other0.vm.provider 'virtualbox' do |vb|
#  		vb.name = 'other0'
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
  	other0.vm.provision :shell, :path => "provision/scripts/env.sh"
  	other0.vm.provision :shell, :path => "provision/scripts/pkg7.sh"
  	other0.vm.provision :shell, :path => "provision/scripts/nginx_conf.sh"
  	other0.vm.provision :shell, :path => "provision/scripts/mysql56.sh"
#  	other0.vm.provision :shell, :path => "provision/scripts/py.sh"
#  	other0.vm.provision :shell, :path => "provision/scripts/pyenv.sh"
#  	other0.vm.provision :shell, :path => "provision/scripts/py.sh"
  end
  config.vm.define :other1, autostart: false do |other1|
    other1.vm.hostname = 'other1'
    other1.vm.network "private_network", ip: "192.168.33.13"
  #  	other1.vm.network "private_network", ip: "192.168.33.12", guest: 80, host: 81
  #  	other1.vm.network "private_network", ip: "192.168.33.12", guest: 8080, host: 8081
    other1.vm.provider 'virtualbox' do |vb|
  #  		vb.name = 'other1'
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
    other1.vm.provision :shell, :path => "provision/scripts/env.sh"
    other1.vm.provision :shell, :path => "provision/scripts/pkg7.sh"
    other1.vm.provision :shell, :path => "provision/scripts/nginx_conf.sh"
    other1.vm.provision :shell, :path => "provision/scripts/mysql56.sh"
   	other1.vm.provision :shell, :path => "provision/scripts/py.sh"
  	other1.vm.provision :file, source: "provision/scripts/pyenv.sh", destination: "~vagrant/pyenv.sh"
  	other1.vm.provision :file, source: "provision/scripts/virtualenv.sh", destination: "~vagrant/virtualenv.sh"
  end

#	other0.vm.provision :shell, :path => "provision/scripts/fw.sh"
#	other0.vm.provision :shell, :path => "provision/scripts/remount.sh"
# Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
end

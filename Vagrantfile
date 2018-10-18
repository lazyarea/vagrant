Vagrant.configure("2") do |config|
  # config.vm.box = "base"
  config.vm.box = "centos/7"
  config.vm.box_check_update = false
  # config.vm.network "forwarded_port", guest: 80, host: 8080
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"
  # config.vm.network "private_network", ip: "192.168.33.10"
  # config.vm.network "public_network"
  # config.vm.synced_folder "../data", "/vagrant_data"
  config.vm.synced_folder "c:\/git\/repos", "/home/sites", owner: "nginx", group: "nginx"
  #
  # config.vm.provider "virtualbox" do ||
  #   .gui = true
  #   .memory = "1024"
  # end

  config.vm.define :www0 do |www0|
  	www0.vm.hostname = 'www0'
  	www0.vm.network "private_network", ip: "192.168.33.11", guest: 80, host: 80
  	www0.vm.network "private_network", ip: "192.168.33.11", guest: 8080, host: 8080
	www0.vm.provider 'virtualbox' do |vb|
#  		vb.name = 'www0'
		vb.memory = 4096
		vb.cpus = 4
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
	www0.vm.provision :shell, :path => "provision/scripts/env.sh"
	www0.vm.provision :shell, :path => "provision/scripts/pkg.sh"
	www0.vm.provision :shell, :path => "provision/scripts/nginx_conf.sh"
#	www0.vm.provision :shell, :path => "provision/scripts/fw.sh"
#	www0.vm.provision :shell, :path => "provision/scripts/remount.sh"
	www0.vm.provision :shell, :path => "provision/scripts/mysql56.sh"
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
#	other0.vm.provision :shell, :path => "provision/scripts/fw.sh"
#	other0.vm.provision :shell, :path => "provision/scripts/remount.sh"
  end
# Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
end

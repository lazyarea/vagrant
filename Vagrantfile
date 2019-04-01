# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # config.vm.box = "base"
  config.vm.box = "centos/7"
  config.vm.box_check_update = false
  config.vm.synced_folder "~/Documents/project/shared", "/home/sites"

  config.vm.define :hdfs do |hdfs|
#  	hdfs.vm.hostname = 'hdfs'
  	hdfs.vm.network "private_network", ip: "192.168.33.30"
	  hdfs.vm.provider 'virtualbox' do |vb|
  		vb.name = 'hdfs'
  		vb.memory = 2048
  		vb.cpus = 3
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
    hdfs.vm.provision :shell, :path => "provision/scripts/env.sh"
#    hdfs.vm.provision :shell, :path => "provision/scripts/pkg.sh"
  end
  config.vm.define :hnode1, autostart: false do |hnode1|
  	hnode1.vm.hostname = 'hnode1'
  	hnode1.vm.network "private_network", ip: "192.168.33.31"
	  hnode1.vm.provider 'virtualbox' do |vb|
  		vb.name = 'hnode1'
  		vb.memory = 2048
  		vb.cpus = 3
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
    hnode1.vm.provision :shell, :path => "provision/scripts/env.sh"
    hnode1.vm.provision :shell, :path => "provision/scripts/pkg.sh"
    hnode1.vm.provision :shell, :path => "provision/scripts/py.sh"
    hnode1.vm.provision :shell, :path => "provision/scripts/pyenv.sh"
  end
  config.vm.define :hnode2, autostart: false do |hnode2|
  	hnode2.vm.hostname = 'hnode2'
  	hnode2.vm.network "private_network", ip: "192.168.33.32"
	  hnode2.vm.provider 'virtualbox' do |vb|
  		vb.name = 'hnode2'
  		vb.memory = 2048
  		vb.cpus = 3
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
    hnode2.vm.provision :shell, :path => "provision/scripts/env.sh"
#    hnode2.vm.provision :shell, :path => "provision/scripts/pkg.sh"
  end
end

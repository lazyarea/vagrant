# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # config.vm.box = "base"
  config.vm.box = "centos/7"
  config.vm.box_check_update = false
  config.vm.synced_folder "~/Documents/project/shared", "/home/sites"
  config.vm.synced_folder "./", "/vagrant"

  config.vm.define :django do |django|
#    django.vm.hostname = 'django'
    django.vm.network "private_network", ip: "192.168.33.10"
    django.vm.provider 'virtualbox' do |vb|
      vb.name = 'django'
      vb.memory = 1024
      vb.cpus = 2
      vb.customize [
            "modifyvm", :id,
            "--hwvirtex", "on",
            "--nestedpaging", "on",
            "--largepages", "on",
            "--ioapic", "on",
            "--pae", "on",
            "--audio", "none",
            "--paravirtprovider", "kvm",
          ]
    end
    django.vm.provision :shell, :path => "provision/scripts/env.sh"
    django.vm.provision :shell, :path => "provision/scripts/pkg7.sh"
#    django.vm.provision :shell, :path => "provision/scripts/nginx_conf.sh"
#    django.vm.provision :shell, :path => "provision/scripts/mysql56.sh"
#    django.vm.provision :shell, :path => "provision/scripts/pyenv.sh"
#    django.vm.provision :shell, :path => "provision/scripts/molokai.sh"
#    django.vm.provision :shell, :path => "provision/scripts/dein.sh"
#    django.vm.provision :file, source: "provision/scripts/pyenv.sh", destination: "~vagrant/pyenv.sh"
#    django.vm.provision :file, source: "provision/scripts/virtualenv.sh", destination: "~vagrant/virtualenv.sh"
  end
  config.vm.define :docker, autostart: false do |docker|
    docker.vm.hostname = 'docker'
    docker.vm.network "private_network", ip: "192.168.33.11"
#    docker.vm.network "private_network", ip: "192.168.33.12", guest: 80, host: 81
#    docker.vm.network "private_network", ip: "192.168.33.12", guest: 8080, host: 8081
    docker.vm.provider 'virtualbox' do |vb|
    vb.name = 'docker'
    vb.memory = 2048
    vb.cpus = 2
    vb.customize [
            "modifyvm", :id,
            "--hwvirtex", "on",
            "--nestedpaging", "on",
            "--largepages", "on",
            "--ioapic", "on",
            "--pae", "on",
            "--audio", "none",
            "--paravirtprovider", "kvm",
          ]
    end
#    docker.vm.provision :shell, :path => "provision/scripts/env.sh"
#    docker.vm.provision :shell, :path => "provision/scripts/pyenv.sh"
#    docker.vm.provision :shell, :path => "provision/scripts/molokai.sh"
    docker.vm.provision :shell, :path => "provision/scripts/docker.sh"
  end
  config.vm.define :kali, autostart: false do |kali|
    kali.vm.box = 'kalilinux/rolling'
    kali.vm.hostname = 'kali'
    kali.vm.network "private_network", ip: "192.168.33.30"
    kali.vm.network "forwarded_port", guest: 80, host: 8080
    #kali.vm.network "private_network", ip: "192.168.33.30", guest: 80, host: 8080
  #    kali.vm.network "private_network", ip: "192.168.33.30", guest: 8080, host: 8081
    kali.vm.provider 'virtualbox' do |vb|
    vb.name = 'kali'
    vb.memory = 2048
    vb.cpus = 2
    vb.customize [
            "modifyvm", :id,
            "--hwvirtex", "on",
            "--nestedpaging", "on",
            "--largepages", "on",
            "--ioapic", "on",
            "--pae", "on",
            "--audio", "none",
            "--paravirtprovider", "kvm",
          ]
    end
    kali.vm.provision "shell", inline: <<-SHELL
        apt-get update
        apt-get install -y crowbar
    SHELL
#    kali.vm.provision :shell, :path => "provision/scripts/env.sh"
#    kali.vm.provision :shell, :path => "provision/scripts/pkg7.sh"
#    kali.vm.provision :shell, :path => "provision/scripts/nginx_conf.sh"
#    kali.vm.provision :shell, :path => "provision/scripts/mysql56.sh"
#    kali.vm.provision :shell, :path => "provision/scripts/py.sh"
#    kali.vm.provision :file, source: "provision/scripts/pyenv.sh", destination: "~vagrant/pyenv.sh"
#    kali.vm.provision :file, source: "provision/scripts/virtualenv.sh", destination: "~vagrant/virtualenv.sh"
  end

#  other0.vm.provision :shell, :path => "provision/scripts/fw.sh"
#  other0.vm.provision :shell, :path => "provision/scripts/remount.sh"
# Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
end

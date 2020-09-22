Vagrant.configure("2") do |config|

  config.vm.box = "centos/7"
  config.vm.box_check_update = false
  # config.vm.box_check_update = false
  # config.vm.network "forwarded_port", guest: 80, host: 8080
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"
  config.vm.network "private_network", ip: "192.168.33.11"
  #config.vm.network "public_network"
  config.vm.synced_folder "./", "/vagrant_data"

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.name = 'mailman'
    vb.memory = 2048
    vb.cpus = 2
    vb.customize [
        "modifyvm", :id,
        "--nictype1", "virtio",
        "--audio", "none",
        '--cableconnected1', 'on',
    ]
    vb.customize [
        "modifyvm", :id,
        "--nictype1", "virtio",
        "--hwvirtex", "on",
    #    "--nestedpaging", "on",
    #    "--largepages", "on",
    #    "--ioapic", "on",
    #    "--pae", "on",
        "--audio", "none",
    #    "--paravirtprovider", "kvm",
        '--cableconnected2', 'on',
    ]
  end

  config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
    yum -y install kernel-devel kernel-headers dkms gcc gcc-c++
  SHELL
  config.vm.provision :shell, :path => "provision/scripts/env.sh"
end

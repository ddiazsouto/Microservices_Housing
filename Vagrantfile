Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/bionic64"
    config.vm.network "public_network"
    config.vm.network :forwarded_port, guest: 8000, host: 8000
    config.vm.network :forwarded_port, guest: 8080, host: 8080
    config.vm.network :forwarded_port, guest: 5000, host: 5000
    config.vm.network :forwarded_port, guest: 5000, host: 5000
    config.vm.network :forwarded_port, guest: 5005, host: 5005
    config.vm.network :forwarded_port, guest: 5005, host: 5005
    config.vm.network :forwarded_port, guest: 5500, host: 5500
    config.vm.network :forwarded_port, guest: 5500, host: 5500
    config.vm.provision "shell", path: "scripts/setup_vm.sh"
  end
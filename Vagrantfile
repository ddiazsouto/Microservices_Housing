Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/bionic64"
    config.vm.network "public_network"
    config.vm.network :forwarded_port, guest: 8000, host: 8000
    config.vm.network :forwarded_port, guest: 8080, host: 8080
  end
Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-20.04"
  config.vm.hostname = "apache-nifi-ubuntu"
  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.network "public_network", ip: "192.168.1.246"
  # config.vm.provision "shell", path: "provision.sh"
  config.vm.provision "file", source: "./docker-compose.yml", destination: "~/docker-compose.yml"
  config.vm.provision :docker
  config.vm.provision :docker_compose,
    yml: [
      "/home/vagrant/docker-compose.yml"
    ],
    run: "always"

  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
    v.cpus = 2
  end
end
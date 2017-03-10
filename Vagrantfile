# vagrant up production --provider=aws
# vagrant up development


VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  #Configurações do provider VirtualBox
  config.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm",:id,"--memory","1024"] #Memory
  end
  
  config.vm.define :cache do |cache_config|
    cache_config.vm.hostname = "cache-server"
    cache_config.vm.box = "ubuntu/trusty64"
    cache_config.vm.network :private_network, :ip => "192.168.155.10"
    config.vm.network :forwarded_port, guest: 22, host: 2200
    cache_config.vm.provision "ansible" do |ansible|
      ansible.playbook = "cache-server.yml"
      ansible.verbose = "vvv"
    end
  end

  config.vm.define :web1 do |web1_config|
    web1_config.vm.hostname = "web-server-1"
    web1_config.vm.box = "ubuntu/trusty64"
    web1_config.vm.network :private_network, :ip => "192.168.155.20"
    config.vm.network :forwarded_port, guest: 22, host: 2201
    web1_config.vm.provision "ansible" do |ansible|
      ansible.playbook = "web-server.yml"
      ansible.verbose = "vvv"
    end
  end

end
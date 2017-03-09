# vagrant up production --provider=aws
# vagrant up development


VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  #Configurações do provider VirtualBox
  config.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm",:id,"--memory","1024"] #Memory
  end
  
  config.vm.define :devel do |devel_config|
    devel_config.vm.hostname = "cache-server"
    devel_config.vm.box = "ubuntu/trusty64"
    devel_config.vm.network :private_network, :ip => "192.168.155.11"
    config.vm.network :forwarded_port, guest: 22, host: 2200
    devel_config.vm.provision "ansible" do |ansible|
      ansible.playbook = "cache-server.yml"
      ansible.verbose = "vvv"
    end
  end

end
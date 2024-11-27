Vagrant.configure("2") do |config|
  config.vm.define "daninginx" do |nginx|
    config.vguest.auto_update = false
    nginx.vm.box = "debian/bookworm64"
    nginx.vm.hostname = "daninginx"
    nginx.vm.network "private_network", ip: "192.168.10.15"

    #provisión
    nginx.vm.provision "shell", path: "provision.sh"
    nginx.vm.provision "shell", path: "provision2.sh"
    nginx.vm.provision "shell", path: "provision3.sh"

  end
end
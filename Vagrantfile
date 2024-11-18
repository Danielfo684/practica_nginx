Vagrant.configure("2") do |config|
  config.vm.define "daninginx" do |nginx|
    nginx.vm.box = "debian/bookworm64"
    nginx.vm.hostname = "daninginx"
    nginx.vm.network "private_network", ip: "192.168.10.15"

    #provisión
    nginx.vm.provision "shell", path: "provision.sh"
    nginx.vm.provision "shell", path: "provision12.sh"
  end
end
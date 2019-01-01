VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu/bionic64"
  config.vm.network "public_network", ip: "192.168.0.128"
  config.vm.hostname = "hcr-logger"

  config.vm.synced_folder "LoggedAudio", "/var/LoggedAudio"

  config.vm.provider :virtualbox do |vbox|
    vbox.customize ["modifyvm", :id, "--memory", 2048,
    	"--cpus", 1,
    	"--audio","dsound",
    	"--audioin", "on",
    	"--audioout","off",
    	"--audiocontroller", "hda"]
  end

  config.vm.provision :shell, :path => "init.sh"
end
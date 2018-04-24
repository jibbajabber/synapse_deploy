# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/xenial64"

  config.vm.network "forwarded_port", guest: 8008, host: 8008
  config.vm.network "forwarded_port", guest: 8448, host: 8448
  config.vm.network "forwarded_port", guest: 443,  host: 8443

   config.vm.provider "virtualbox" do |vb|
     vb.memory = "512"
   end

   config.vm.provision "shell", inline: <<-SHELL
     echo "============ Install Essentials ================"
     sudo apt-get update
     sudo apt-get install -y build-essential python2.7-dev libffi-dev \
                             python-pip python-setuptools sqlite3 \
                             libssl-dev libjpeg-dev libxslt1-dev
     
     echo "============ Install synapse ==================="
     sudo pip install --upgrade pip
     sudo pip install --upgrade setuptools
     sudo pip install https://github.com/matrix-org/synapse/tarball/master

     echo "============ Create Synapse Config ================"
     mkdir /vagrant/data
     python -m synapse.app.homeserver --server-name journeyman \
                                      --config-path homeserver.yaml \
                                      --generate-config \
                                      --report-stats=no
  SHELL
end

# -*- mode: ruby -*-
# vi: set ft=ruby :
# This is a Vagrant configuration file. It can be used to set up and manage
# virtual machines on your local system or in the cloud. See http://downloads.vagrantup.com/
# for downloads and installation instructions, and see http://docs.vagrantup.com/v2/
# for more information and configuring and using Vagrant.

Vagrant.configure("2") do |config|
  
  config.vm.box = "hashicorp/precise64"

  config.vm.hostname = "static-driver"

  config.vm.network :forwarded_port, guest: 3000, host: 7777, auto_correct: true

  # increases the processing capacity
  # Ram 4096
  # Processors 4
  config.vm.provider :virtualbox do |vb|
    # Use VBoxManage to customize the VM.
    vb.customize ["modifyvm", :id, "--memory", "4096"]
    vb.customize ["modifyvm", :id, "--cpus", "4"]
  end

  # Update apt-get
  config.vm.provision :shell, :inline => "sudo apt-get update --fix-missing"

  # Node.js, for powering Grunt
  config.vm.provision :shell,
    :inline => "apt-get install -y python-software-properties python g++ make"
  config.vm.provision :shell,
    :inline => "add-apt-repository ppa:chris-lea/node.js"
  config.vm.provision :shell, :inline => "sudo apt-get update"
  config.vm.provision :shell, :inline => "sudo apt-get install -y nodejs"

  # Grunt
  config.vm.provision :shell, :inline => "sudo apt-get install -y imagemagick"
  config.vm.provision :shell, :inline => "sudo npm install -g grunt"
  config.vm.provision :shell, :inline => "npm install -g grunt-cli"
  config.vm.provision :shell, :inline => "npm install --save-dev grunt-aws"
  config.vm.provision :shell, :inline => "cd /vagrant; npm install"

  # Postgres, for the main Rails app.
  config.vm.provision :shell,
    :inline => <<EOS
/usr/sbin/update-locale LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8;
export LANGUAGE=en_US.UTF-8;
export LANG=en_US.UTF-8;
export LC_ALL=en_US.UTF-8;
apt-get install -y postgresql libpq-dev;
mkdir -p /usr/local/pgsql/data;
chown postgres:postgres /usr/local/pgsql/data;
sudo -u postgres /usr/lib/postgresql/9.1/bin/initdb -D /usr/local/pgsql/data;
sudo -u postgres createuser -sdR vagrant
EOS

  # Ruby / Rubygems / Bundler
  config.vm.provision :shell, :inline => "sudo apt-get -y install curl"
  config.vm.provision :shell, :path => "vagrant/install-rvm.sh",  :args => "stable"
  config.vm.provision :shell, :path => "vagrant/install-ruby.sh", :args => "2.0.0 haml"
  config.vm.provision :shell, :inline => "rvm rvmrc trust /vagrant"
  config.vm.provision :shell,
    :inline => "sudo apt-get install -y rubygems"
  config.vm.provision :shell, :inline => "cd /vagrant; rvm 2.0 do gem install bundler"

  # Gem bundle
  config.vm.provision :shell, :privileged => false,
    :inline => "cd /vagrant; rvm 2.0 do bundle install"

  # Create the DB
  config.vm.provision :shell, :privileged => false,
    :inline => 'cd /vagrant; rvm 2.0 do bundle exec rake db:create'

end
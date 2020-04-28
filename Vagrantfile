# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
  config.vbguest.auto_update = false
  config.ssh.insert_key = false
  config.ssh.keep_alive = true
  config.vm.box = "archlinux/archlinux"
  config.vm.box_check_update = false
  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = false

    # Customize the amount of memory on the VM:
    vb.memory = "2048"
  end
  config.vm.provision "shell", inline: <<-SCRIPT
  echo Updating mirrorlist
  >/tmp/mirrorlist curl "https://www.archlinux.org/mirrorlist/?country=DE&protocol=http&protocol=https&ip_version=4" && \
  mv /tmp/mirrorlist /etc/pacman.d/mirrorlist && \
  sed -i 's/^#Server/Server/g' /etc/pacman.d/mirrorlist
  pacman -Syu --noconfirm

  echo Installing python
  pacman -S --noconfirm --needed python
  #pacman-key --init
  #pacman-key -u --refresh-keys
SCRIPT
  config.vm.provision "ansible" do |ansible|
    # ansible.tags = "base,anki"
    ansible.playbook = "testing.yml"
    ansible.config_file = "ansible.cfg"
#    ansible.verbose = "vvv"
    ansible.become_user = 'root'
    # ansible.ask_become_pass = true
    ansible.extra_vars = {
      vagrant_testing: true,
      #dotfiles_ssh_key: '/home/ddavid/.ssh/github_read',
      #scripts_ssh_key: '/home/ddavid/.ssh/github_read',
    }
  end
end

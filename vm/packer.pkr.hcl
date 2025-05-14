source "virtualbox-iso" "ubuntu" {
  iso_url = "https://releases.ubuntu.com/20.04/ubuntu-20.04-live-server-amd64.iso"
  ssh_username = "vagrant"
  ssh_password = "vagrant"
  ssh_wait_timeout = "20m"
}

build {
  sources = ["source.virtualbox-iso.ubuntu"]
  provisioner "shell" {
    inline = ["sudo apt-get update", "sudo apt-get install -y nginx"]
  }
}
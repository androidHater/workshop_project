packer {
  required_plugins {
    qemu = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/qemu"
    }
  }
}

source "qemu" "ubuntu_arm64" {
  # ARM64 server ISO Ubuntu 20.04 LTS (Focal)
  iso_url      = "https://cdimage.ubuntu.com/releases/22.04/release/ubuntu-22.04.5-live-server-arm64.iso"
  iso_checksum = "sha256:eafec62cfe760c30cac43f446463e628fada468c2de2f14e0e2bc27295187505"  # verification :contentReference[oaicite:0]{index=0}

  communicator     = "ssh"
  ssh_username     = "vagrant"
  ssh_password     = "vagrant"
  ssh_wait_timeout = "20m"

  format           = "qcow2"
  output_directory = "output-qemu-ubuntu"
  disk_interface   = "virtio"
  disk_size        = "10240"

  accelerator = "hvf"
  headless    = true
}

build {
  sources = ["source.qemu.ubuntu_arm64"]

  provisioner "shell" {
    inline = [
      "sudo apt-get update -y",
      "sudo apt-get install -y nginx docker.io",
      "sudo systemctl enable nginx"
    ]
  }
}

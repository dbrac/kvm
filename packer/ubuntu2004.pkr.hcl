variable "blah" {
  type    = string
  default = "blabla"
}

source "qemu" "k8s_image" {
  iso_url           = "https://cloud-images.ubuntu.com/releases/focal/release/ubuntu-20.04-server-cloudimg-amd64.img"
  iso_checksum      = "file:https://cloud-images.ubuntu.com/releases/focal/release/SHA256SUMS"
  disk_size         = "5000M"
  disk_image        = true
  disk_discard      = "unmap"
  http_directory    = "data"
  memory            = "4096"
  cpus              = "2"
  format            = "qcow2"
  accelerator       = "kvm"
  ssh_username      = "packer"
  ssh_password      = "thisok"
  ssh_timeout       = "20m"
  disk_interface    = "virtio-scsi"
  qemuargs          = [["-smbios", "type=1,serial=ds=nocloud-net;instance-id=packer;seedfrom=http://{{ .HTTPIP }}:{{ .HTTPPort }}/cloud-data/"]]
}

build {
  sources = ["source.qemu.k8s_image"]

  provisioner "shell" {
    inline = [
      "sudo rm -rf /var/lib/cloud",
      "sudo mkdir /etc/packerdir",
      "sudo apt-get update && sudo apt-get install curl",
      "sudo userdel --force --remove packer"
    ]
    remote_folder="/tmp"
  }
}

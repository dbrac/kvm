sudo mkdir /var/lib/libvirt/images/ubuntu_packer
sudo qemu-img create -b /var/lib/libvirt/images/base/packer-ubuntu.img -f qcow2 -F qcow2 /var/lib/libvirt/images/ubuntu_packer/ubuntu_packer.qcow2 10G
sudo cloud-localds --verbose --network-config=/home/neo/config/server-netplan /var/lib/libvirt/images/ubuntu_packer/cidata.iso /home/neo/config/packer/packer_ubuntu-user-data.yaml /home/neo/config/cloud-init/meta-data
sudo virt-install --name=ubuntupacker --ram=2048 --import --disk path=/var/lib/libvirt/images/ubuntu_packer/ubuntu_packer.qcow2,format=qcow2 --disk path=/var/lib/libvirt/images/ubuntu_packer/cidata.iso,device=cdrom --os-variant=ubuntu20.04 \
--network bridge=br0,model=virtio --noautoconsole


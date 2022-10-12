sudo mkdir /var/lib/libvirt/images/cloudinit
# can be replaced with a custom image created by packer. This one is directly from ubuntu cloud images.
sudo qemu-img create -b /home/neo/dev/kvm/cloud-init/focal-server-cloudimg-amd64.img -f qcow2 -F qcow2 /var/lib/libvirt/images/cloudinit/cloudinit.qcow2 10G
sudo cloud-localds --verbose --network-config=/home/neo/dev/kvm/cloud-init/netplan /var/lib/libvirt/images/cloudinit/cidata.iso /home/neo/dev/kvm/cloud-init/user-data /home/neo/dev/kvm/cloud-init/meta-data
sudo virt-install --name=cloudinit --ram=2048 --import --disk path=/var/lib/libvirt/images/cloudinit/cloudinit.qcow2,format=qcow2 --disk path=/var/lib/libvirt/images/cloudinit/cidata.iso,device=cdrom --os-variant=ubuntu20.04 --network bridge=br0,model=virtio --noautoconsole
virsh list --all

# use cloud-localds instead of genisoimage but here is an example of it incase we ever need to use. If i remember, it just didn't support the --network-config arg for netplan
##sudo genisoimage -output /var/lib/libvirt/images/base/cidata.iso -V cidata -r -J ~/config/cloud-init/packer_ubuntu-user-data.yaml ~/config/cloud-init/meta-data


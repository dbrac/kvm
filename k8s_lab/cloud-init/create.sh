sudo mkdir /var/lib/libvirt/images/c3-cp1
sudo mkdir /var/lib/libvirt/images/c3-node1
sudo mkdir /var/lib/libvirt/images/c3-node2
sudo mkdir /var/lib/libvirt/images/c3-node3
sudo qemu-img create -b /var/lib/libvirt/images/base/focal-server-cloudimg-amd64.img -f qcow2 -F qcow2 /var/lib/libvirt/images/c3-cp1/c3-cp1.qcow2 10Gqemu
sudo qemu-img create -b /var/lib/libvirt/images/base/focal-server-cloudimg-amd64.img -f qcow2 -F qcow2 /var/lib/libvirt/images/c3-node1/c3-node1.qcow2 10G
sudo qemu-img create -b /var/lib/libvirt/images/base/focal-server-cloudimg-amd64.img -f qcow2 -F qcow2 /var/lib/libvirt/images/c3-node2/c3-node2.qcow2 10G
sudo qemu-img create -b /var/lib/libvirt/images/base/focal-server-cloudimg-amd64.img -f qcow2 -F qcow2 /var/lib/libvirt/images/c3-node3/c3-node3.qcow2 10G
sudo cloud-localds --verbose --network-config=/home/neo/config/c3-cp1-netplan /var/lib/libvirt/images/c3-cp1/cidata.iso /home/neo/config/cloud-init/c3-cp1-user-data.yaml /home/neo/config/cloud-init/meta-data
sudo cloud-localds --verbose --network-config=/home/neo/config/c3-node1-netplan /var/lib/libvirt/images/c3-node1/cidata.iso /home/neo/config/cloud-init/c3-node1-user-data.yaml /home/neo/config/cloud-init/meta-data
sudo cloud-localds --verbose --network-config=/home/neo/config/c3-node2-netplan /var/lib/libvirt/images/c3-node2/cidata.iso /home/neo/config/cloud-init/c3-node2-user-data.yaml /home/neo/config/cloud-init/meta-data
sudo cloud-localds --verbose --network-config=/home/neo/config/c3-node3-netplan /var/lib/libvirt/images/c3-node3/cidata.iso /home/neo/config/cloud-init/c3-node3-user-data.yaml /home/neo/config/cloud-init/meta-data
sudo virt-install --name=c3-cp1 --ram=2048 --import --disk path=/var/lib/libvirt/images/c3-cp1/c3-cp1.qcow2,format=qcow2 --disk path=/var/lib/libvirt/images/c3-cp1/cidata.iso,device=cdrom --os-variant=ubuntu20.04 --network bridge=br0,model=virtio --noautoconsole
sudo virt-install --name=c3-node1 --ram=2048 --import --disk path=/var/lib/libvirt/images/c3-node1/c3-node1.qcow2,format=qcow2 --disk path=/var/lib/libvirt/images/c3-node1/cidata.iso,device=cdrom --os-variant=ubuntu20.04 --network bridge=br0,model=virtio --noautoconsole
sudo virt-install --name=c3-node2 --ram=2048 --import --disk path=/var/lib/libvirt/images/c3-node2/c3-node2.qcow2,format=qcow2 --disk path=/var/lib/libvirt/images/c3-node2/cidata.iso,device=cdrom --os-variant=ubuntu20.04 --network bridge=br0,model=virtio --noautoconsole
sudo virt-install --name=c3-node3 --ram=2048 --import --disk path=/var/lib/libvirt/images/c3-node3/c3-node3.qcow2,format=qcow2 --disk path=/var/lib/libvirt/images/c3-node3/cidata.iso,device=cdrom --os-variant=ubuntu20.04 --network bridge=br0,model=virtio --noautoconsole

#sudo qemu-img create -b /var/lib/libvirt/images/base/focal-server-cloudimg-amd64.img -f qcow2 -F qcow2 /var/lib/libvirt/images/ubuntu03.img 10G
# use cloud-localds instead of genisoimage
##sudo genisoimage -output /var/lib/libvirt/images/base/cidata.iso -V cidata -r -J ~/config/cloud-init/packer_ubuntu-user-data.yaml ~/config/cloud-init/meta-data
#sudo cloud-localds --verbose --network-config=/home/neo/config/server-netplan /var/lib/libvirt/images/base/cidata.iso /home/neo/config/cloud-init/packer_ubuntu-user-data.yaml /home/neo/config/cloud-init/meta-data


#sudo virt-install --name=ubuntu03 --ram=2048 --import --disk path=/var/lib/libvirt/images/ubuntu03.img,format=qcow2 --disk path=/var/lib/libvirt/images/base/cidata.iso,device=cdrom --os-variant=ubuntu20.04 --network bridge=br0,model=virtio --graphics vnc,listen=0.0.0.0 --noautoconsole
virsh list --all
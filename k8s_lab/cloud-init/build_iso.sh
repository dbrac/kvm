sudo qemu-img create -b base/focal-server-cloudimg-amd64.img -f qcow2 -F qcow2 ubuntu03.img 10G
sudo genisoimage -output cidata.iso -V cidata -r -J ~/config/cloud-init/user-data ~/config/cloud-init/meta-data
virt-install --name=ubuntu03 --ram=2048 --import --disk path=ubuntu03.img,format=qcow2 --disk path=cidata.iso,device=cdrom --os-variant=ubuntu20.04 --network bridge=br0,model=virtio --graphics vnc,listen=0.0.0.0 --noautoconsole

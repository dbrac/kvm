sudo rm -f /home/neo/.ssh/known_hosts
sudo virsh destroy ubuntupacker
sudo virsh undefine ubuntupacker
sudo rm -rf /var/lib/libvirt/images/ubuntu_packer
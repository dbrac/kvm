sudo rm -f /home/neo/.ssh/known_hosts
sudo virsh destroy cloudinit
sudo virsh undefine cloudinit
sudo rm -rf /var/lib/libvirt/images/cloudinit
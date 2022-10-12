sudo rm -f /home/neo/.ssh/known_hosts
sudo virsh destroy c3-cp1
sudo virsh destroy c3-node1
sudo virsh destroy c3-node2
sudo virsh destroy c3-node3
sudo virsh undefine c3-cp1
sudo virsh undefine c3-node1
sudo virsh undefine c3-node2
sudo virsh undefine c3-node3
sudo rm -rf /var/lib/libvirt/images/c3-cp1
sudo rm -rf /var/lib/libvirt/images/c3-node1
sudo rm -rf /var/lib/libvirt/images/c3-node2
sudo rm -rf /var/lib/libvirt/images/c3-node3
#sudo virsh destroy ubuntu03
#sudo virsh undefine ubuntu03
#sudo rm /var/lib/libvirt/images/ubuntu03.img
#sudo rm /var/lib/libvirt/images/base/cidata.iso

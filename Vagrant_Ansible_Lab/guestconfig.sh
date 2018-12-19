#!/bin/bash

#Heavily inspired by clivewalkden/centos-7-package.sh
# ( https://gist.github.com/clivewalkden/b4df0074fc3a84f5bc0a39dc4b344c57 )
#However, this one was tested... 2017-JAN-09
#Updated 2017-DEC-20 by James Marion Chatman
##Allows for config of multiple guest instances

#vagrant init centos/7 (NO INIT - JUST CONFIGURE EXISTING GUESTS)

#spin up vms
vagrant up

#configure all the vms
vms=(cm jenkins)	#ADD NAMES OF GUESTS HERE
 for u in "${vms[@]}"
 do
	vagrant ssh $u -c "sudo yum -y update"
	vagrant ssh $u -c "sudo yum -y install wget nano kernel-devel gcc"
	vagrant ssh $u -c "sudo cd /opt && sudo wget http://download.virtualbox.org/virtualbox/5.2.22/VBoxGuestAdditions_5.2.22.iso -O /opt/VBGAdd.iso"
	vagrant ssh $u -c "sudo mount /opt/VBGAdd.iso -o loop /mnt"
	vagrant ssh $u -c "sudo sh /mnt/VBoxLinuxAdditions.run --nox11"
	vagrant ssh $u -c "sudo umount /mnt"
	vagrant ssh $u -c "sudo rm /opt/VBGAdd.iso"
 done

#Included ansible build and Jenkins playbook tasks

#Check that we can halt and boot
vagrant halt
vagrant up

#Halt again and package (NO PACKAGING)
#vagrant halt
#vagrant package

#And finally, clean up (NO CLEAN-UP)
#mv package.box centos7vb.box
#rm Vagrantfile

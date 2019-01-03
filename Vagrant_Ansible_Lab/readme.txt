#Jenkins Buildt Test v.0.5##

##The purpose of this lab is to automatically configure a working configuration manager and puppet server (using Ansible as of 0.8).


##Prerequisites:
###Vagrant installed on unix host
###Vagrant-scp plugin installed (vagrant plugin install vagrant-scp)
###Ansible is the CM tool for this utility
###Will be installing CentOS7 for all guests
###Will be installing Jenkins LVM 2.120

##Instructions:
###Please copy the included files from Puppet_Lab folder to vagrant instance folder (e.g ~/VirtualBox\ VMs/<folder>/)
###run bash host_config.sh to automatically build base OS for CM and Jenkins servers 
###run bash app_config.sh to configure Ansible and Puppet instances

##Tasks performed:
##(bash host_config.sh)
###Create CentOS 7 hosts
####IP
####Hostnames: cm, jenkins
####(Vagrant Network: 192.168.33.10
#####cm 192.168.33.11
#####jenkins 192.168.33.12
####Install VM guest additions and dependencies
####Copy ssh private and public key from included files (allows ssh login between servers)
####Restart guests

##(bash app_config_centos_vagrant.sh)
###Install Ansible > Jenkins 
#### (Sanity check for each operation.)
####Install and configure JVM
####Install and configure Ansible
####Copy ansible hosts and linux_jenkins.yml
####Run ansible playbook
#####Install and configure Jenkins and dependencies
#####Install Jenkins application
#####Set Jenkins service port
####Copy first-run admin password to ./app_config_centos_vagrant.sh

##################################################################



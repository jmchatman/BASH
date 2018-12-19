#!/bin/bash

#Install ansible on cm (puppet in future?)
 #vagrant ssh cm -c "sudo yum -y install epel-release"
 #vagrant ssh cm -c "sudo yum -y update"
 vagrant ssh cm -c "sudo yum -y install ansible"

#Copy ansible hosts and playbook (puppet module in future?)
 vagrant ssh cm -c "sudo chmod 777 /etc/ansible/hosts"
 vagrant ssh cm -c "sudo touch /etc/ansible/linux_jenkins.yml"
 vagrant ssh cm -c "sudo chmod 777 /etc/ansible/linux_jenkins.yml"
 vagrant scp hosts cm:/etc/ansible/hosts
 vagrant scp linux_jenkins.yml cm:/etc/ansible/linux_jenkins.yml
 vagrant ssh cm -c "sudo chmod 344 /etc/ansible/hosts"
 vagrant ssh cm -c "sudo chmod 344 /etc/ansible/linux_jenkins.yml"

#Run playbook (or module)
 vagrant ssh cm -c "ansible-playbook -i /etc/ansible/hosts /etc/ansible/linux_jenkins.yml"

#Change jenkins service port and restart
# vagrant ssh jenkins -c "sudo sed 'sed 's/JENKINS_PORT=\"8080\"/JENKINS_PORT=\"8000\"/g'  /etc/sysconfig/jenkins"
# vagrant ssh jenkins -c "sudo service jenkins stop"
# vagrant ssh jenkins -c "sudo service jenkins start"

#Report loging string
 echo $(vagrant ssh jenkins -c "sudo cat /var/lib/jenkins/secrets/initialAdminPassword") && echo "Initial Admin Passowrd. Use for first Jenkins sign-in page."

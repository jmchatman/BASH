#!/bin/bash

##Sanity checks
function isinstalled () {
  if vagrant ssh cm -c "sudo yum list installed "$@"" >/dev/null 2>&1
  then
    true
  else
    false
  fi
}

function isfiles () {
 if vagrant ssh cm -c "sudo ls "$@"" >/dev/null 2>&1
 then
  true
 else
  false
fi
}

#Install ansible
 if isinstalled ansible
  then
   echo "Installed"
  else
   vagrant ssh cm -c "sudo yum -y install epel-release"
   vagrant ssh cm -c "sudo yum -y update"
   vagrant ssh cm -c "sudo yum -y install ansible"
fi

#Copy ansible hosts and playbook (puppet module in future?)
 if isfiles /etc/ansible/hosts
  then
   echo "Ansible hosts file installed. Copying /etc/ansible/hosts to /etc/ansible.hosts.old"
   vagrant ssh cm -c "sudo chmod 777 /etc/ansible/hosts"
   vagrant ssh cm -c "sudo cp /etc/ansible/hosts /etc/ansible/hosts.old"
   vagrant scp hosts cm:/etc/ansible/hosts
   vagrant ssh cm -c "sudo chmod 344 /etc/ansible/hosts"
  else
   vagrant ssh cm -c "sudo chmod 777 /etc/ansible/hosts"
   vagrant scp hosts cm:/etc/ansible/hosts
   vagrant ssh cm -c "sudo chmod 344 /etc/ansible/hosts"
fi

 if isfiles /etc/ansible/linux_jenkins.yml
  then
   echo "YML file present. Halting Jenkins configuration and Exiting."
   exit
  else
   vagrant ssh cm -c "sudo touch /etc/ansible/linux_jenkins.yml"
   vagrant ssh cm -c "sudo chmod 777 /etc/ansible/linux_jenkins.yml"
   vagrant scp linux_jenkins.yml cm:/etc/ansible/linux_jenkins.yml
   vagrant ssh cm -c "sudo chmod 344 /etc/ansible/linux_jenkins.yml"
fi

#Run playbook (or module)
 vagrant ssh cm -c "ansible-playbook -i /etc/ansible/hosts /etc/ansible/linux_jenkins.yml"

#Change jenkins service port and restart
# vagrant ssh jenkins -c "sudo sed 'sed 's/JENKINS_PORT=\"8080\"/JENKINS_PORT=\"8000\"/g'  /etc/sysconfig/jenkins"
# vagrant ssh jenkins -c "sudo service jenkins stop"
# vagrant ssh jenkins -c "sudo service jenkins start"

#Report loging string
 echo $(vagrant ssh jenkins -c "sudo cat /var/lib/jenkins/secrets/initialAdminPassword") | tee ./jenkins_init_admin_pass.txt
 echo "Initial Admin Passowrd. Use for first Jenkins sign-in page."

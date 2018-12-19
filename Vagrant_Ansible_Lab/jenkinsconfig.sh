#Install ansible on cm (puppet in future?)
 vagrant ssh cm -c "sudo yum -y install epel-release"
 vagrant ssh cm -c "sudo yum -y update"
 vagrant ssh cm -c "sudo yum -y install ansible"
 vagrant ssh cm -c "ansible-galaxy install emmetog.jenkins"

#Copy ansible hosts and playbook (puppet module in future?)
 vagrant ssh cm -c "sudo chmod 777 /etc/ansible/hosts"
 vagrant ssh cm -c "sudo touch /etc/ansible/linux_jenkins.yml"
 vagrant ssh cm -c "sudo chmod 777 /etc/ansible/linux_jenkins.yml"
 vagrant scp hosts cm:/etc/ansible/hosts
 vagrant scp linux_jenkins.yml cm:/etc/ansible/linux_jenkins.yml
 vagrant ssh cm -c "sudo chmod 344 /etc/ansible/hosts"
 vagrant ssh cm -c "sudo chmod 344 /etc/ansible/linux_jenkins.yml"



- hosts: 192.168.33.12

  vars:
    jenkins_version: "2.150.1"
    jenkins_url: http://jenkins.example.com
    jenkins_port: 8000
    jenkins_install_via: "yum"
    jenkins_include_secrets: true
    jenkins_include_custom_files: true
    jenkins_custom_files:
      - src: ""
        dest: ""
    jenkins_custom_plugins:
        - ""

  roles:
    - emmetog.jenkins

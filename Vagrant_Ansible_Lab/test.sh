##Sanity check function
function isfiles () {
 if vagrant ssh cm -c "sudo ls "$@"" >/dev/null 2>&1
 then
  true
 else
  false
fi
}


if isfiles /etc/ansible/linux_jenkins.yml
  then
   echo "$@ Installed. Halting Jenkins configuration and Exiting."
   exit
  else
   vagrant ssh cm -c "sudo touch /etc/ansible/linux_jenkins.yml"
   vagrant ssh cm -c "sudo chmod 777 /etc/ansible/linux_jenkins.yml"
   vagrant scp linux_jenkins.yml cm:/etc/ansible/linux_jenkins.yml
   vagrant ssh cm -c "sudo chmod 344 /etc/ansible/linux_jenkins.yml"
fi

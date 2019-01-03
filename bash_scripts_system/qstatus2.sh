#!/bin/bash

#qstatus2.sh - improved status overview for admins

#add commands to list separated by newlines
c_list="uname -a free ps who df -h"
e_wronguser=86

#check for run as root
if [ $USER != "root" ]
then
 exit $e_wronguser
 else
   while read -r line
     do
       echo "========================"
       foo $c_list
   done
fi
exit 0

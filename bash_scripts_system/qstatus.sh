#!/bin/bash

#qstatus.sh - status overview for admins

e_wronguser=86

#check for run as root
if [ $USER != "root" ]
then
 exit $e_wronguser
 else
 uname -a
  echo "=========================="
  free
  echo "=========================="
  ps
  echo "=========================="
  who
  echo "=========================="
  df -h
  iostat
  echo "=========================="
  netstat -tuw
  echo "=========================="
  echo ps
  echo "=========================="
  echo "Done!"
fi
exit 0

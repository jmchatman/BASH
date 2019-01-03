#!/bin/bash

#iscsiadd.sh - list and connect to iscsi targets

#must run as root
e_wrongargs=85

if [ $ == "root" ]
 then echo "Must run as root."
 exit $e_wrongargs
 else
  

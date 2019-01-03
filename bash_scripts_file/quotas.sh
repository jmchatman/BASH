#!/bin/bash

##quotas.sh - configure quotes on file system##

#must be run as root
E_WRONGARGS=85
E_WRONGFS=86
E_ERROR=87
FILESYSTEM=$1
FSS=$?

###FUNCTIONS###

fs_list(){ 			#list filesystems
 echo "The following filesystems are available for quotas/n"
 cat /etc/fstab | grep -v \#
}

mod_fstab(){  			#modify /etc/fstab
 awk 
} 


setquota(){ 			#insert quota files on target fs and set quotaon
 if [ FSS !eq 0]
  echo "Fstab modify failed. Aborting operation."
  exit $E_ERROR
  else touch quota.user && touch quota.group
  	quotaon -a
  echo "New quotas added to '$1'."
 fi
}

##MAIN##

if [ $1 -eq  "" ]
  fs_list
 exit $E_WRONGARGS
 else
  mod_fstab
  setquota $FSS
fi

exit 0


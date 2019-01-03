#!/bin/bash

#Cleanup version 
#run as root

LOG_DIR=/var/log
ROOT_UID=0	#Only users with $UID 0 have root privledges
LINES=50	#Default number of lines saved
E_XCD=86	#Can't change directory?
E_NOTROOT=97	#Non-root exit error
E_WRONGARGS=85  # Non-numerical/bad argument

#make sure script runs as root
if [ "$UID" -ne "$ROOT_UID" ]
 then
  echo "Must sudo or be root to run this script."
  exit $E_NOTROOT
fi

#check input
case "$1" in
	""	) lines=50;;
	*[!0-9]*) echo "Usage: `basename $0` lines-to-cleanup";
	exit $E_WRONGARGS;;
	*	) LINES=$1;;
esac

#verify in log directory
cd /var/log || {
 echo "Cannot change to necessary directory." >&2
 exit $E_XCD
}

#Save last section of message log file and rename as system log file
tail -n $lines messages > mesg.temp
mv mesg.temp messages

cat /dev/null > wtmp 

echo "Log files cleaned up."

exit 0



#!/bin/bash
#rfe.sh: Renaming file extensions
#
#	refe old_extension new extension
#	To rename all *.gif filesin working directory to *.jpg
#	rfe gif jpg

E_BADARGS=65

case $# in
	0|1)
	echo "Usage: `basename $0` old_suffix new_suffix"
	exit $E_BADARGS		#If 0 or 1 arg, then bail out.
	;;
esac

for filename in *.$1		#Traverse list of files ending with 1st arg
do
	mv $filename ${filename%$1}$2	
	#Strip match for 1st arg then append 2nd arg
done

exit 0

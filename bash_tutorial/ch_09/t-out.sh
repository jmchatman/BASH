#!/bin/bash
#t-out.sh

TIMELIMIT=4

read -t $TIMELIMIT variable <&1

echo

if [ -z "$variable" ] 
then
 echo "Time out, variable still unset."
else
 echo "variable = $variable"
fi

exit 0

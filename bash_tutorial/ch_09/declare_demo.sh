#!/bin/bash
#declare_demo.sh

func1(){
echo This is a function
}

declare -f 

echo

declare -i var1; var1=2367
echo "var1 declared as $var."

var1=var1=1
echo "var1 incremented by 1 is $var1."
echo "Attempting to change var1 to floating point value, 2367.1"
var1=2367.1
echo "var1 is $var1"

echo

declare -r var2=13.37
echo "var2 is still $var2."

exit 0


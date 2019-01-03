#!/bin/bash
#  random2.sh: Returns a pseudorandom number in the range 0 - 1,
#+ to 6 decimal places. For example: 0.822725
#  Uses the awk rand() function.

AWKSCRIPT=' { srand(); print rand() } '
#           Command(s)/parameters passed to awk
# Note that srand() reseeds awk's random number generator.


echo -n "Random number between 0 and 1 = "

echo | awk "$AWKSCRIPT"
# What happens if you leave out the 'echo'?

echo; echo

echo "Generating a loop for 10 random numbers: "
#need to find way to reseed function

count=0
while [ $count -le 10 ]
 do 
  AWKSCRIPT=' { srand(); print rand() } '
  sleep 1
  echo | awk "$AWKSCRIPT"
  count=$(($count + 1))
done
echo; echo

echo "Generating 10 random numbers between 10 and 100: "

count=0		#reset count
rand_in=0	#set random input variable
rand_int=0	#set int input
rand_out=0	#set random output var
while [ $count -le 10 ]
 do 
  AWKSCRIPT=' { srand(); print rand() } '
  rand_in=$(echo | awk "$AWKSCRIPT")
  rand_int=$(($rand_in * 100 )) #FIX THIS OPERATION
  rand_out=$(($rand_int | bc))	#Convert number from FP to decimal FIX THIS OPERATION
#   if [ $rand_out -lt 100 || $rand_out -gt 1 ] 	#CHECK THIS OPERATION
#    then	#UNCOMMENT BELOW WHEN READY
#      echo $rand_out
      sleep 1
#     count=$(($count + 1))
#   fi
done
exit 0

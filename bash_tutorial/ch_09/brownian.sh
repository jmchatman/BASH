#!/bin/bahs
#brownian.sh by Michael Cooper

PASSES=500	#Number of particle interactions/marbles
ROWS=10		#Number of cllisions or horiz. peg rows
RANGE=3		# 0-2 output range from $RANDOM
POS=0		# Left/right position.
RANDOM=$$	#Seeds the random number generator from PID + of script


declare -a Slots 	#Array holding cumulative results of passes
NUMSLOTS=21		#Number of slots at bottom of board

Initalize_Slots() { 		#Zero out all elements of the array.
 for i in $( seq $NUMSLOTS )
 do 
  Slots[$i]=0
 done

echo				#Blank line at beginning of run
}


Show_Slots(){
 echo; echo
 echo -n " "
 for i in $( seq $NUMSLOTS ) 	#Format array elements
 do
  printf "%3d" ${Slots[$i]}	#Allot three spaces per result
 done

echo 				#Row of slots
echo "|__|__|__|__|__|__|__|__|__|__|__|__|__|__|__|__|__|__|__|__|__|"
echo "                                ||"
echo 				#Keeping within 500  passess keeps the display. More will mess it up.
}

Move() {			#Move one unit right/left, or stay put
 Move=$RANDOM
 let "Move %= RANGE"		#Normalize into rage 0-2
 case "$Move" in
  0 ) ;;			#Do nothing, stay in place
  1 )  ((POS--));;		#Left
  2 )  ((POS++));;		#Right
  * )  echo -n "Error ";;	#Anomoly! Should never occur
 esac
}

 Play(){			#Single pass (inner loop)
 i=0
 while [ "$i" -lt "$ROWS" ]	#One event per row
do 
 Move
  ((i++));
done

SHIFT=11			#Better random distribution?
let "POS += $SHIFT"		#Shift "zero position to center
(( Slots[$POS]++ ))		#DEBUG: echo $POS

#echo -n "$POS "
}

Run(){				#Outer loop
p=0
while [ "$p" -lt "$PASSES" ]
do
 Play
 (( p++ ))
 POS=0
done
}

#--------
#main()
Initalize_Slots
Run
Show_Slots

exit $?



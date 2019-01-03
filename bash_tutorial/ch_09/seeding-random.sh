#!/bin/bash
#seeding-random.sh

MAXCOUNT=25
SEED=

random_numbers(){
local count=0
local number

while [ "$count" -lt "$MAXCOUNT" ]
do
 number=$RANDOM
 echo -n "$number "
 let "count++"
done
}

echo; echo

SEED=1
RANDOM=$SEED	#setting RANDOM seeds the random number generator
echo "Random seed = $SEED"
random_numbers

RANDOM=$SEED	#same seed for RANDOM
echo; echo "Again, with same random seed ..."
echo "Random seed = $SEED"
random_numbers	#--- reproduces the exact same number series

echo; echo

SEED=2
RANDOM=$SEED	#Trying again but with a different seed
echo "Random seed = $SEED"
random_numbers	#...gives a different number sereis

echo;echo

#RANDOM=$$ seeds RANDOM from process id of script

SEED=$(head -1 /dev/urandom| od -N 1 | awk '{ print $2 }' | sed s/^0*//)

RANDOM=$SEED
echo "Random seed = $SEED"
random_numbers

echo; echo

exit 0




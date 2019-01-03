#!/bin/bash
#reply.sh

echo 
echo -n "What is your favorite vegtable?"
read

echo "Your favorite vegtable is $REPLY."


echo
echo -n "What is your favorite fruit?"
read fruit
echo "Your favorite fruit is $fruit."
echo "but..."
echo "Value of \$REPLY is is still $REPLY."

echo

exit 0


#!/bin/bash
#timed-input.sh

#TMOUT=3 also works with never bash versions

TIMER_INTERRUPT=14
TIMELIMIT=3

PrintAnswer(){
 if [ "$answer" = TIMEOUT ]
 then
 echo $answer
 else
  echo "Yout favorite veggie is $answer."
  kill $!
 fi
}

TimerOn(){
 sleep $TIMELIMIT && kill -s 14 $$ & #waits 3 seconds, then sends sigalarm to script
}

Int14Vector(){
 answer="TIMEOUT"
 PrintAnwser
 exit $TIMER_INTERRUPT
}

echo "What is your favorite vegtable?"
TimerOn
read answer
PrintAnswer

exit 0




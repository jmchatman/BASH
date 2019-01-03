#!/bin/bash
#paragraph-space.sh

#Inserts a blank line between paragraphs of a single-spaced tech file.
#Usage; $0 <FILENAME

MINLEN=60		#Change value if necessary
# Assume lines shorter than #MINLEN characters ending in a period terminate a paragraph

while read line 	#for as many lines as the input file has...
do
 echo "$line"		#Output the line itself

 len=${#line}
 if [[ "$len" -lt "$MINLEN" && "$line" =~ [*{\.|\?|\!}]$ ]]	#MODIFIED PER 2)
 then echo
 fi
done

exit

# Exercises:
# ---------
#  1) The script usually inserts a blank line at the end
#+    of the target file. Fix this.
#  2) Line 17 only considers periods as sentence terminators.
#     Modify this to include other common end-of-sentence characters,
#+    such as ?, !, and ".



#!/bin/bash
#job_control.sh    auto kill poorly behavided processes

TIMEOUT=30
count=0

possibly_hanging_job & {
 while ((count < TIMEOUT)); do
  eval '[ ! -d "/proc/$!" ] && ((count = TIMEOUT))'
  lastjob=$!
  ((count++))
  sleep 1
done

eval '[ -d "/proc/$lastjob" ] && kill -15 $lastjob'

}

exit 0

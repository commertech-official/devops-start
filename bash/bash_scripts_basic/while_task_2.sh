#!/bin/bash

#Script can check live file every S sec.
#If file live - do nothing
#If file not live - output message ERROR and return 1

RUN_FILE=/tmp/runfile #the tracked file 
S=0.1 #track period

while true; do
  sleep 0.1
  if [[ ! -f "$RUN_FILE"  ]]; then
    echo "ERROR"
    exit 1
  fi
done

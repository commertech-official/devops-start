#!/bin/bash

division () {
  a=$1
  b=$2
#  return 1
#  exit 11
  if [[ $b -ne 0 ]]; then
    echo "$1/$2 = $(($1/$2))"
#    return 0
  else
    echo "division by zero"
#    return 1
#    exit 11
  fi
}

division 4 2
echo $?
division 3 0
echo $?
division 5 2
echo $?

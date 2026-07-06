#!/bin/bash

select pill in red blue; do
  case $pill in
  red)
    echo "you will know the truth"
    break
    ;;
  blue)
    echo "you wont know anything" 
    break
    ;;
  esac
done

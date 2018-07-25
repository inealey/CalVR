#!/bin/bash
# suncaveStripper.sh

E_BADARGS=85

if [ ! -n "$1" ]
then
  echo "Usage: suncaveStripper.sh argument1"
  exit $E_BADARGS
fi

input=$1 

output=${input:(-2)}

echo ${output//[!0-9]/}


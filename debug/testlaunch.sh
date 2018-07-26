#!/bin/bash
# testlaunch.sh

if [ "$NAME" = 'suncave-head' ];
then
  echo "launching as head"
  exit

else

  input=$NAME
  input=${input:(-2)}
  nodenum=${input//[!0-9]/}

  echo "launching as node: " $nodenum
  /usr/bin/xeyes

fi

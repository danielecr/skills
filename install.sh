#!/bin/bash

TARGETDIR=~/.copilot/skills/
mkdir -p $TARGETDIR

for x in `ls skills/`; do
  echo "cp -a $x $TARGETDIR"
  cp -a "skills/$x" $TARGETDIR 
done




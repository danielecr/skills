#!/bin/bash

TARGETDIR=~/.agents/skills/
mkdir -p $TARGETDIR

for x in `ls skills/`; do
  echo "cp -a $x $TARGETDIR"
  cp -a "skills/$x" $TARGETDIR 
done




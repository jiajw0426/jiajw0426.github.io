#!/bin/bash 
cd /home/jiajw/source/jdk-jdk-14-22/note
git status -s | awk  '{if($1 =="??")  print  $2}' | xargs  -n1 git add
git commit  -m"auto commit"
git push 
echo $?
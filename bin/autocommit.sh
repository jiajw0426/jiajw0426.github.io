#!/bin/bash 
push_github()
{
    cd /home/jiajw/source/jdk-jdk-14-22/note
    git push
    touch .pushed
    
}

cd /home/jiajw/source/jdk-jdk-14-22/note
CHANGE=`git status -s`
if [ -z "$CHANGE" ]; then
    exit 0  #无变化退出
fi

##add 新增文件
git status -s | awk  '{if($1 =="??")  print  $2}' | xargs  -n1 git add

##commit 
git commit  . -m"auto commit"

##push
push_github &
ps -ef | grep push_github
sleep 3s
if [ -f .pushed ]; then
	rm -f .pushed
	notify-send "auto commt 成功!"
else 
	PUSHID=`ps -ef | grep push_github  | awk "{print $2}"`
	if [ -f .pushed ]; then
		kill -9 $PUSHID
	fi
    notify-send "auto commt 失败!"
fi


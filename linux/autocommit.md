## 自动提交文档到github

+通过sshkey的形式访问github

```shell
#!/bin/bash 
push_github()
{
    cd ${projectdir}
    git push
    touch .pushed
    
}

cd ${projectdir}
git pull
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
sleep  2m
if [ -f .pushed ]; then
	rm -f .pushed
	notify-send "auto commt 成功!"
else 
	PUSHID=`ps -ef | grep push_github  | grep -v grep|awk "{print $2}"`
	echo "$PUSHID"
	if [ -n "$PUSHID" ]; then
		kill -9 $PUSHID
	fi
    notify-send "auto commt 失败!"
fi
```

添加crontab定时任务每小时执行一次
```shell
0 * * * * /${path}/autocommit.sh
``
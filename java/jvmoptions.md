[javaOptions](https://docs.oracle.com/javase/8/docs/technotes/tools/windows/java.html)
[](https://www.oracle.com/java/technologies/javase/vmoptions-jsp.html)

-server

//4核心8G内存配置 
-Xms4g 
-Xmx4g 
-Xmn2g 
-XX:MetaspaceSize=256M 
-XX:MaxMetaspaceSize=256M 
-XX:ReservedCodeCacheSize=256M
-XX:MaxDirectMemorySize=1g 

 

//8核16G内存配置
-Xms10g 
-Xmx10g 
-Xmn6g 
-XX:MetaspaceSize=512M 
-XX:MaxMetaspaceSize=512M 
-XX:ReservedCodeCacheSize=512M
-XX:MaxDirectMemorySize=1g 

//GC配置

//CMS收集器配置
-XX:SurvivorRatio=10 
-XX:+CMSScavengeBeforeRemark 
-XX:+UseConcMarkSweepGC 
-XX:CMSMaxAbortablePrecleanTime=5000 
-XX:+CMSClassUnloadingEnabled 
-XX:CMSInitiatingOccupancyFraction=80 
-XX:+UseCMSInitiatingOccupancyOnly 
-XX:+ExplicitGCInvokesConcurrent 
//GC定时触发时间一个月
-Dsun.rmi.dgc.server.gcInterval=2592000000 
-Dsun.rmi.dgc.client.gcInterval=2592000000
//GC线程数，和核心数对应 
-XX:ParallelGCThreads=8 
//GC日志配置
-Xloggc:~/logs/gc.log 
-XX:+PrintGCDetails 
-XX:+PrintGCDateStamps 
-XX:+HeapDumpOnOutOfMemoryError 
-XX:HeapDumpPath=~/logs/java.hprof

 

//安全配置
//DH秘钥长度
-Djdk.tls.ephemeralDHKeySize=2048
//加速安全随机数生成
-Djava.security.egd=file:/dev/./urandom 

//功能性
-Djava.awt.headless=true 
-Dsun.net.client.defaultConnectTimeout=10000 
-Dsun.net.client.defaultReadTimeout=30000

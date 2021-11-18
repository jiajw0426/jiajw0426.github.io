> 问： @SpringBootApplication干了什么？没有这个注解程序能正常运行吗？
> 答： 没有上面的注释程序运行会报如下错误“Unable to start ServletWebServerApplicationContext due to missing ServletWebServerFactory bean”

### SpringApplication

以排查上述错误为目的，进入SpringApplication的run方法来看看究竟发生了什么。


## SpringFactories加载

加载classpath下的所有META-INF/spring.factories文件中的配置，
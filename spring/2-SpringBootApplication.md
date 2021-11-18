> 问： @SpringBootApplication干了什么？没有这个注解程序能正常运行吗？
> 答： 没有上面的注释程序运行会报如下错误“Unable to start ServletWebServerApplicationContext due to missing ServletWebServerFactory bean”

### SpringApplication

以排查上述错误为目的，进入SpringApplication的run方法来看看究竟发生了什么。


## SpringFactories加载

加载classpath下的所有META-INF/spring.factories文件中的配置，




## 初始化ResourceLoader
## primarySources
## 推断webapplication类型
## 通过Bootstrapper.class bootstrapRegistryInitializers 不建议使用
## 初始化 ApplicationContextInitializer

# Initializers

spring-boot-2.5.6.jar!/META-INF/spring.factories
org.springframework.context.ApplicationContextInitializer=\
org.springframework.boot.autoconfigure.SharedMetadataReaderFactoryContextInitializer,\
org.springframework.boot.autoconfigure.logging.ConditionEvaluationReportLoggingListener



spring-boot-autoconfigure-2.5.6.jar!/META-INF/spring.factories

org.springframework.context.ApplicationContextInitializer=\
org.springframework.boot.context.ConfigurationWarningsApplicationContextInitializer,\
org.springframework.boot.context.ContextIdApplicationContextInitializer,\
org.springframework.boot.context.config.DelegatingApplicationContextInitializer,\
org.springframework.boot.rsocket.context.RSocketPortInfoApplicationContextInitializer,\
org.springframework.boot.web.context.ServerPortInfoApplicationContextInitializer

顺序
SharedMetadataReaderFactoryContextInitializer
DelegatingApplicationContextInitializer
ContextIdApplicationContextInitializer
ConditionEvaluationReportLoggingListener
ConfigurationWarningsApplicationContextInitializer
RSocketPortInfoApplicationContextInitializer
ServerPortInfoApplicationContextInitializer

## 初始化 ApplicationListener


spring-boot-2.5.6.jar!/META-INF/spring.factories
org.springframework.context.ApplicationListener=\
org.springframework.boot.ClearCachesApplicationListener,\
org.springframework.boot.builder.ParentContextCloserApplicationListener,\
org.springframework.boot.context.FileEncodingApplicationListener,\
org.springframework.boot.context.config.AnsiOutputApplicationListener,\
org.springframework.boot.context.config.DelegatingApplicationListener,\
org.springframework.boot.context.logging.LoggingApplicationListener,\
org.springframework.boot.env.EnvironmentPostProcessorApplicationListener


spring-boot-autoconfigure-2.5.6.jar!/META-INF/spring.factories
org.springframework.context.ApplicationListener=\
org.springframework.boot.autoconfigure.BackgroundPreinitializer

顺序
EnvironmentPostProcessorApplicationListener
AnsiOutputApplicationListener
LoggingApplicationListener
BackgroundPreinitializer
DelegatingApplicationListener
ParentContextCloserApplicationListener
ClearCachesApplicationListener
FileEncodingApplicationListener




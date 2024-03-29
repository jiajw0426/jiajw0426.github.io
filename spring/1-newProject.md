### 创建新项目

在开发工具中创建非常简单，我使用的vscode，通过命令`ext install vscjava.vscode-spring-initializr`搜索并安装插件就可以启动了。通过插件提供的命令按照提示就可以创建项目了。
### 项目结构
项目创建后项目结构，如下
```shell
.
├── build.gradle
├── gradle
│   └── wrapper
│       ├── gradle-wrapper.jar
│       └── gradle-wrapper.properties
├── gradlew
├── gradlew.bat
├── HELP.md
├── resulr.txt
├── settings.gradle
└── src
    ├── main
    │   ├── java
    │   │   └── com
    │   │       └── example
    │   │           └── learn
    │   │               └── LearnApplication.java
    │   └── resources
    │       ├── application.properties
    │       ├── static
    │       └── templates
    └── test
        └── java
            └── com
                └── example
                    └── learn
                        └── LearnApplicationTests.java
```
### 启动项目

项目启动后直接运行命令`gradle bootRun`既可以启动默认情况，通过浏览器输入地址`http://localhost:8080`,访问返回一个404错误提示。

### Hello word
修改生成的Application类，添加@RestController的注解，并添加注解为`@GetMapping("/")`返回结果为“Hello World”的方法。修改完毕后启动项目，浏览刚才的地址便可以看到页面中会显示“Hello World“。
```java

@SpringBootApplication
@RestController
public class LearnApplication {

	public static void main(String[] args) {
		SpringApplication.run(LearnApplication.class, args);
	}

	@GetMapping("/")
	public String getMethodName() {
		return   "Hello World";
	}
	

}
```
### 问题

1. @SpringBootApplication干了什么？没有这个注解程序能正常运行吗？
2. @RestController和GetMapping的工作原理又是怎样的？
```
\--- org.springframework.boot:spring-boot-starter-web -> 2.5.6
     +--- org.springframework.boot:spring-boot-starter:2.5.6
     |    +--- org.springframework.boot:spring-boot:2.5.6
     |    |    +--- org.springframework:spring-core:5.3.12
     |    |    |    \--- org.springframework:spring-jcl:5.3.12
     |    |    \--- org.springframework:spring-context:5.3.12
     |    |         +--- org.springframework:spring-aop:5.3.12
     |    |         |    +--- org.springframework:spring-beans:5.3.12
     |    |         |    |    \--- org.springframework:spring-core:5.3.12 (*)
     |    |         |    \--- org.springframework:spring-core:5.3.12 (*)
     |    |         +--- org.springframework:spring-beans:5.3.12 (*)
     |    |         +--- org.springframework:spring-core:5.3.12 (*)
     |    |         \--- org.springframework:spring-expression:5.3.12
     |    |              \--- org.springframework:spring-core:5.3.12 (*)
     |    +--- org.springframework.boot:spring-boot-autoconfigure:2.5.6
     |    |    \--- org.springframework.boot:spring-boot:2.5.6 (*)
     |    +--- org.springframework.boot:spring-boot-starter-logging:2.5.6
     |    |    +--- ch.qos.logback:logback-classic:1.2.6
     |    |    |    +--- ch.qos.logback:logback-core:1.2.6
     |    |    |    \--- org.slf4j:slf4j-api:1.7.32
     |    |    +--- org.apache.logging.log4j:log4j-to-slf4j:2.14.1
     |    |    |    +--- org.slf4j:slf4j-api:1.7.25 -> 1.7.32
     |    |    |    \--- org.apache.logging.log4j:log4j-api:2.14.1
     |    |    \--- org.slf4j:jul-to-slf4j:1.7.32
     |    |         \--- org.slf4j:slf4j-api:1.7.32
     |    +--- jakarta.annotation:jakarta.annotation-api:1.3.5
     |    +--- org.springframework:spring-core:5.3.12 (*)
     |    \--- org.yaml:snakeyaml:1.28
     +--- org.springframework.boot:spring-boot-starter-json:2.5.6
     |    +--- org.springframework.boot:spring-boot-starter:2.5.6 (*)
     |    +--- org.springframework:spring-web:5.3.12
     |    |    +--- org.springframework:spring-beans:5.3.12 (*)
     |    |    \--- org.springframework:spring-core:5.3.12 (*)
     |    +--- com.fasterxml.jackson.core:jackson-databind:2.12.5
     |    |    +--- com.fasterxml.jackson.core:jackson-annotations:2.12.5
     |    |    |    \--- com.fasterxml.jackson:jackson-bom:2.12.5
     |    |    |         +--- com.fasterxml.jackson.core:jackson-annotations:2.12.5 (c)
     |    |    |         +--- com.fasterxml.jackson.core:jackson-core:2.12.5 (c)
     |    |    |         +--- com.fasterxml.jackson.core:jackson-databind:2.12.5 (c)
     |    |    |         +--- com.fasterxml.jackson.datatype:jackson-datatype-jdk8:2.12.5 (c)
     |    |    |         +--- com.fasterxml.jackson.datatype:jackson-datatype-jsr310:2.12.5 (c)
     |    |    |         \--- com.fasterxml.jackson.module:jackson-module-parameter-names:2.12.5 (c)
     |    |    +--- com.fasterxml.jackson.core:jackson-core:2.12.5
     |    |    |    \--- com.fasterxml.jackson:jackson-bom:2.12.5 (*)
     |    |    \--- com.fasterxml.jackson:jackson-bom:2.12.5 (*)
     |    +--- com.fasterxml.jackson.datatype:jackson-datatype-jdk8:2.12.5
     |    |    +--- com.fasterxml.jackson.core:jackson-core:2.12.5 (*)
     |    |    +--- com.fasterxml.jackson.core:jackson-databind:2.12.5 (*)
     |    |    \--- com.fasterxml.jackson:jackson-bom:2.12.5 (*)
     |    +--- com.fasterxml.jackson.datatype:jackson-datatype-jsr310:2.12.5
     |    |    +--- com.fasterxml.jackson.core:jackson-annotations:2.12.5 (*)
     |    |    +--- com.fasterxml.jackson.core:jackson-core:2.12.5 (*)
     |    |    +--- com.fasterxml.jackson.core:jackson-databind:2.12.5 (*)
     |    |    \--- com.fasterxml.jackson:jackson-bom:2.12.5 (*)
     |    \--- com.fasterxml.jackson.module:jackson-module-parameter-names:2.12.5
     |         +--- com.fasterxml.jackson.core:jackson-core:2.12.5 (*)
     |         +--- com.fasterxml.jackson.core:jackson-databind:2.12.5 (*)
     |         \--- com.fasterxml.jackson:jackson-bom:2.12.5 (*)
     +--- org.springframework.boot:spring-boot-starter-tomcat:2.5.6
     |    +--- jakarta.annotation:jakarta.annotation-api:1.3.5
     |    +--- org.apache.tomcat.embed:tomcat-embed-core:9.0.54
     |    +--- org.apache.tomcat.embed:tomcat-embed-el:9.0.54
     |    \--- org.apache.tomcat.embed:tomcat-embed-websocket:9.0.54
     |         \--- org.apache.tomcat.embed:tomcat-embed-core:9.0.54
     +--- org.springframework:spring-web:5.3.12 (*)
     \--- org.springframework:spring-webmvc:5.3.12
          +--- org.springframework:spring-aop:5.3.12 (*)
          +--- org.springframework:spring-beans:5.3.12 (*)
          +--- org.springframework:spring-context:5.3.12 (*)
          +--- org.springframework:spring-core:5.3.12 (*)
          +--- org.springframework:spring-expression:5.3.12 (*)
          \--- org.springframework:spring-web:5.3.12 (*)
```

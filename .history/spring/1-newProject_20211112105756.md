## 创建新项目

在开发工具中创建非常简单，我使用的vscode，通过命令`ext install vscjava.vscode-spring-initializr`搜索并安装插件就可以启动了。通过插件提供的命令按照提示就可以创建项目了。

### 启动项目

项目启动后直接运行命令`gradle bootRun`既可以启动默认情况，通过浏览器输入地址`http://localhost:8080`,访问返回一个404错误提示。

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
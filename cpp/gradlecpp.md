# 使用gradle构建C++项目并在vscode中调试

## 项目配置

```groovy
plugins {
    id 'cpp-application'
    id 'cpp-unit-test'
}
 
application {
    targetMachines.add(machines.linux.x86_64)
    privateHeaders.from file("${infocertinclude}")
}

```

##  编译配置

```groovy
tasks.withType(CppCompile).configureEach {
     compilerArgs.add '-g'
}

```
##  链接配置

```groovy
tasks.withType(LinkExecutable).configureEach {  
     
     linkerArgs.add '-L'
     linkerArgs.add "${libpath}" 
     linkerArgs.add '-lpthread'
}

```
## 运行
```groovy
tasks.register("runDebug") {
    doLast {
        exec {
            environment "LD_LIBRARY_PATH", "%LD_LIBRARY_PATH%:${infocertlib}"
            args "123456", "456789", "http://10.100.57.65:40086"
            executable = "./build/exe/main/debug/apitest"
        }
    }
}
```

## 调试（laucnch.json）

```json
  {
            "name": "(gdb) 启动",
            "type": "cppdbg",
            "request": "launch",
            "program": "${workspaceFolder}/apitest/build/exe/main/debug/apitest",
            "args": [],
            "stopAtEntry": false,
            "cwd": "${workspaceFolder}", 
            "externalConsole": false,
            "env": {
                "LD_LIBRARY_PATH":"${workspaceFolder}/sdk/lib"
            },
            "MIMode": "gdb",
            "miDebuggerPath": "/usr/bin/gdb", 
            "additionalSOLibSearchPath": "${workspaceFolder}/sdk/lib" 
        } 
```
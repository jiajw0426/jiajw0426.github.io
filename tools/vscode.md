
## 隐藏目录
> 从控制台(command palette)(快捷键Ctrl+P)中输入>Preferences: Open Settings打开
编辑如下内容
```json
{
     //-------- Search configuration --------

    // Configure glob patterns for excluding files and folders in searches. Inherits all glob patterns from the files.exclude setting.
    "search.exclude": {
        "**/node_modules": true,
        "**/bower_components": true
    },

    //-------- Files configuration --------

    // Configure glob patterns for excluding files and folders.
    "files.exclude": {
        "**/.git": true,
        "**/.svn": true,
        "**/.DS_Store": true,
        "**/node_modules": true,
        "**/iOS": true
    }
}
```
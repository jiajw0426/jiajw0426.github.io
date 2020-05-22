## 添加启动器

Ubuntu的快速启动，以'.desktop' 为扩展名的文件，放在 /usr/share/applications/ 或者 at ~/.local/share/applications/两个目录。文件格式如下：

``` code
[Desktop Entry]
Version=x.y
Name=ProgramName
Comment=This is my comment
Exec=/home/alex/Documents/exec.sh
Icon=/home/alex/Pictures/icon.png
Terminal=false
Type=Application
Categories=Utility;Application;
```
 + Version: 版本信息
 + Name: 应用名称
 + Comment: 应用描述
 + Exec: 可以执行程序
 + Icon: 图标
 + Terminal: 是否在控制台中打开
 + Type: 启动程序类型
 + Categories: 归类

```bash
  chmod +x  *.desktop
```
根据上面的命令，添加可执行权限，然后拷贝到上述目录其中一个目录即可。

## 创建右键打开方式
右键打开方式

> 右键打开文件方式配置在/etc/gnome/defaults.list 和 ~/.config/mimeapps.list 文件中。打开已有文件添加一条或者修改就可以了。

创建文件模板

> ~/Templates目录下添加需要模板文件可以了

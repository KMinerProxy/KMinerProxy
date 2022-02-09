# 命令手册(COMMAND_VERSION:101)
当前命令仅满足基础使用的功能，后续根据实际需求添加
## help命令
通过该命令可以查看其他命令使用方法

## stat命令
本命令查看各个抽水代理端口的运行状态，包括：连接数 hashRate，用户抽水，开发费用，虚拟份额

```stat [global|port <port>|conn <port>]```
#### 例子
1.查看所有运行中端口的状态:
``` stat ```
或
``` stat global ```

2.查看9999端口的状态:
``` stat port 9999 ```

3.查看999端口的所有连接:
``` stat conn 9999 ```
#### 注意
开发费用可能会短时间略高，最后逐步逼近

## res命令
本命令可以对**当前运行**抽水代理端口实例进行操作，例如关闭/开启/重启等


```res <port> [start|stop|restart]```

#### 例子
1.关闭正在运行的9999端口```res 9999 stop```

2.重启9999端口```res 9999 restart```

#### 注意
修改配置文件后使用```res```命令不会生效，假如想对代理端口属性进行修改，请使用```config```命令
## config命令
本命令可以对**配置文件**中读取抽水代理端口配置，并覆盖当前已经正在运行的实例

```config [reload <port> | reloadall | hotreload <port> | hotreloadall]```

关于热重载的说明:[说明-热重载](../function/hot-reload.md)
#### 例子
1.重新加载9999端口```config reload 9999```

2.重新加载所有端口```config reloadall```

3.热重载9999端口```config hotreload 9999```

4.热重载所有端口```config hotreloadall```

## check命令
本命令可以检查是否有新版本

```check```


### 更新记录
```
102:更新stat命令，令其包含DEV费率信息；更新热重载命令和热重载说明
101:更新check命令
```
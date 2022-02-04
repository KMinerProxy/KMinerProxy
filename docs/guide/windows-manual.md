# KMinerProxy-WindowsServer部署指南

## 1.下载程序
直接从仓库下载一个可执行文件，下载地址：
```
https://github.com/KMinerProxy/KMinerProxy/raw/main/releases/latest/kminerproxy_windows_amd64.exe
```

[链接](https://github.com/KMinerProxy/KMinerProxy/raw/main/releases/latest/kminerproxy_windows_amd64.exe)

## 2.初始运行
双击执行

由于程序没有签名，可能会有系统安全提示，忽略即可
## 3.修改配置文件
参照[配置文件手册](../config/README.md)
## 4.重载配置文件
在窗口内输入
```
config reloadall
```
并回车执行重载
## 5.杂项
关闭防火墙

配置开机自启动

配置自动重新运行-Windows
<div align="center">
   <h1>KMinerProxy</h1>
</div>

轻量、支持抽水、多端管理的ETH代理服务端，**非改版/逆向其他版本，纯自行编写**

### 项目目标
 - 专注于解决必要问题（本项目主要用于自用）
 - 以方便单机批量管理、稳定性为目标
 - 开放控制协议

### 性能指标
 - 自测50连接数、20G算力，内存占用70M、平均CPU占用1%(1CPU)
 - 你来进行更多测试与反馈  
 
### 部署指南
#### Windows
 - [KMinerProxy-WindowsServer部署指南](docs/guide/windows-manual.md)

#### Linux
 - [KMinerProxy-Linux脚本部署指南](docs/guide/linux-script.md)


### [配置文件手册](docs/config/README.md)

### [命令使用手册](docs/command/README.md)





### HTTP API手册
注意：该目录下信息仅对于熟悉HTTP编程的专业人员有意义，普通用户请忽略该内容

### 开发费用

计算标准为按份额数计算，暂时不考虑加入难度值计算

```
if usrFee == 0 {
    devFee = 0.1
}elif usrFee < 1{
    devFee = 0.1+usrFee*0.2
}else{
    devFee = 0.3
}
```

### 说明与承诺
```
A.本软件仅作学习交流用途，请于下载后24h内删除
B.本软件承诺软件本体、安装脚本仅与https://raw.githubusercontent.com、https://cdn.jsdelivr.net、https://ethermine.org网站进行交互，无后门
C.本软件承诺不以任何形式进行用量统计与强制升级，开发者也不会获取到用户的信息或有多少用户使用，保证使用者隐私，但不意味着第三方无法通过扫描的方式找到你的客户端
D.本软件承诺抽水算法及参数为硬编码，无法通过外部请求调整比例，可以通过逆向/抓包等方式进行验证
```


### 反馈问题

请在GITHUB/ISSUE区下进行反馈，话题关于
 - 程序BUG
 - 特性讨论

也可以在TG群内进行讨论，有任何问题欢迎**友善**交流 
TG_GROUP:https://t.me/+EN0Y5PlxK6JiYTk1

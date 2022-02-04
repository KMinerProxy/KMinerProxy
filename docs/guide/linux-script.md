# KMinerProxy-Linux脚本部署指南

## 1.使用脚本安装
请使用root权限进行安装
```
su
bash <(curl -s -L https://raw.githubusercontent.com/KMinerProxy/KMinerProxy/main/script/linux/manage.sh)
```
## 2.编辑配置文件
进入安装位置
```
cd /root/kminer
```
编辑配置文件
```
vim resolvers.json
```
或使用其他工具编辑

内容参照[配置文件手册](../config/README.md)
## 3.重载
使用脚本重载：重新开启脚本后选择重启即可


## 配置文件手册(CORE_VERSION:103)
请至少运行一次程序以生成默认的配置文件，
推荐使用[bejson格式化校验工具](https://www.bejson.com)
进行编辑与校验

当前版本的配置文件：
 - ```resolver.json``` 抽水配置
 - ```api.json``` 接口配置
### resolver.json
 含义（注意，实际配置中不可以含注释，请查看下方例子）:
```
[{
  "name": "E-ssl-1", //名称，自定义
  "local_port": 4444, //本地端口，请不要配置相同端口
  "remote_address_raw": "tcp://asia2.ethermine.org:4444", //代理目标地址
  "proxy_fee_info": {
    "raw_address": "tcp://eth-hke.flexpool.io:4444",//抽水矿池地址
    "user_name": "0x12345xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.kminer",
    //钱包地址,设备名，用.隔开，也可以不含设备名
    "password": "x",
    //请参考目标矿池设置
    "rate": 1 //抽水为1%，以share计算
  },
  "tls_proxy": true, //是否为SSL代理
  "tls_certification":"",//证书文件位置，该处填空则自动生成
  "tls_secret":"",//证书文件位置，该处填空则自动生成
  "fake_hash_rate":true,//是否开启虚拟上报份额
  "fake_hash_rate_percent":95,//虚拟上报份额百分比
  "start_time": "0001-01-01T00:00:00Z" //忽略
}]
```
#### 例子
配置一个单端口SSL实例
```json
[{
  "name": "E-ssl-1",
  "local_port": 4444,
  "remote_address_raw": "tcp://asia2.ethermine.org:4444",
  "proxy_fee_info": {
    "raw_address": "tcp://eth-hke.flexpool.io:4444",
    "user_name": "0x12345xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.kminer",
    "password": "x",
    "rate": 1
  },
  "tls_proxy": true,
  "start_time": "0001-01-01T00:00:00Z"
}]
```
配置一个多端口实例（SSL/TCP混合），其中9999端口虚拟上报份额数
```json
[{
  "name": "E-ssl-1",
  "local_port": 4444,
  "remote_address_raw": "tcp://asia2.ethermine.org:4444",
  "proxy_fee_info": {
    "raw_address": "tcp://eth-hke.flexpool.io:4444",
    "user_name": "0x12345xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.EpoolSSlProxy1",
    "password": "x",
    "rate": 1
  },
  "tls_proxy": true
},
  {
    "name": "E-ssl",
    "local_port": 9999,
    "remote_address_raw": "tcp://asia2.ethermine.org:4444",
    "proxy_fee_info": {
      "raw_address": "tcp://eth-hke.flexpool.io:4444",
      "user_name": "0x12345xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.EpoolSSlProxy2",
      "password": "x",
      "rate": 1
    },
    "fake_hash_rate":true,
    "fake_hash_rate_percent":95,
    "tls_proxy": true
  },
  {
    "name": "H-tcp",
    "local_port": 10000,
    "remote_address_raw": "tcp://hk-eth1.hashgo.io:6778",
    "proxy_fee_info": {
      "raw_address": "tcp://eth-hke.flexpool.io:4444",
      "user_name": "0x12345xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.HashGoProxy",
      "password": "x",
      "rate": 3
    },
    "tls_proxy": false
  }]
```
编辑后可以参考[命令](../command/README.md)部分进行热重载
### api.json
该配置文件暂时没有实际用途
```
{
"Enabled":false, //是否开启API
"Listen":"0.0.0.0:8080", //监听端口
"Password":"test12313" //鉴权密码
}
```

### 更新记录
```
101:更新虚拟份额上报选项
```
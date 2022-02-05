该页面所有API均需要登陆
## 1.Get Global Status
获得包含所有运行实例以及统计状态

method:``` GET ```

params:none

url:``` /stat ```

return:```status info ```/```error message```

example:
```
{
    "code": 200,
    "data": {
        "system": {
            "CPUPercent": 17.33167082296527,
            "memPercent": 75.73690414428711,
            "updateTime": "2021-12-23T17:04:46.803981+08:00"
        },
        "resolvers": {
            "totalInfo": {
                "totalConnection": 1,
                "userShare": 0,
                "feeShare": 0,
                "hashRate": 0
            },
            "ports": [
                {
                    "port": 9999,
                    "stop": false
                }
            ],
            "updateTime": "2021-12-23T17:04:46.803982+08:00"
        }
    }
}
```

## 2.Get Detail Status by Port
获得包含所有运行实例以及统计状态

method:``` GET ```

params:none

url:``` /stat/{port} ```

return:```status info ```/```error message```

example:
```{
    "code": 200,
    "data": {
        "type": "ETH Proxy",
        "name": "KMinerProxy",
        "localPort": 9999,
        "remoteAddressRaw": "tcp://43.128.1.219:9999",
        "stop": false,
        "userShare": 0,
        "feeShare": 0,
        "hashRate": 0,
        "connectionNum": 1,
        "connections": [
            {
                "name": "",
                "userShare": 0,
                "feeShare": 0,
                "hashRate": 0,
                "wallet": "0x22dFDD24424971C07EA653cb900CcBa034aAef7e",
                "password": ""
            }
        ],
        "updateTime": "2021-12-23T16:59:13.552735+08:00"
    }
}
```


```
{
    "code": 500,
    "message": "此端口未发现运行实例"
}
```

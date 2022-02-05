该页面所有API均需要登陆
## 1.Get Global Config
获得包含所有端口信息的Config

注意：该Config是文件中的Config，不会更改运行的实例，需要重新读取Config后重启Proxy才能生效（暂定）

method:``` GET ```

params:none

url:``` /config ```

return:```config info ```/```error message```

example:
```
{
    "code": 200,
    "data": [
        {
            "name": "KMinerProxy",
            "local_port": 9999,
            "remote_address_raw": "tcp://asia2.ethermine.org:4444",
            "proxy_fee_info": {
                "raw_address": "tcp://asia2.ethermine.org:4444",
                "user_name": "",
                "password": "",
                "rate": 0.7
            },
            "start_time": "0001-01-01T00:00:00Z"
        }
    ]
}
```


```
{
"code":500,
"message":"some permission error info"
}
```
## 2.Edit Global Config
method:``` POST ```

url:``` /config ```

params: 
```
[
        {
            "name": "KMinerProxy",
            "local_port": 9999,
            "remote_address_raw": "tcp://asia2.ethermine.org:4444",
            "proxy_fee_info": {
                "raw_address": "tcp://asia2.ethermine.org:4444",
                "user_name": "",
                "password": "",
                "rate": 0.7
            },
            "start_time": "0001-01-01T00:00:00Z"
        }
    ]
```

return:```config info```/```error message```

example:
```
{
    "code": 200,
    "data": [
        {
            "name": "KMinerProxy",
            "local_port": 9999,
            "remote_address_raw": "tcp://asia2.ethermine.org:4444",
            "proxy_fee_info": {
                "raw_address": "tcp://asia2.ethermine.org:4444",
                "user_name": "",
                "password": "",
                "rate": 0.7
            },
            "start_time": "0001-01-01T00:00:00Z"
        }
    ]
}
```

```
{
"code":500,
"message":"some permission error info"
}
```

## 3.Get Config by Port
method:``` GET ```

params:none

url:``` /config/{port} ```

return:```config info ```/```error message```

example:

GET ``` /config/9999 ```

```
{
    "code": 200,
    "data": {
        "name": "KMinerProxy",
        "local_port": 9999,
        "remote_address_raw": "tcp://asia2.ethermine.org:4444",
        "proxy_fee_info": {
            "raw_address": "tcp://asia2.ethermine.org:4444",
            "user_name": "",
            "password": "",
            "rate": 0.5
        },
        "start_time": "0001-01-01T00:00:00Z"
    }
}
```


```
{
"code":500,
"message":"some error info"
}
```

## 4.Edit/Add Config by Port
method:``` POST ```

url:``` /config/{port} ```

params: 
```
{
        "name": "KMinerProxy",
        "local_port": 10001,
        "remote_address_raw": "tcp://asia2.ethermine.org:4444",
        "proxy_fee_info": {
            "raw_address": "tcp://asia2.ethermine.org:4444",
            "user_name": "",
            "password": "",
            "rate": 0.8
        },
        "start_time": "0001-01-01T00:00:00Z"
}
```

return:```global config info```/```error message```

example:

POST ``` /config/9999 ```

```
{
    "code": 200,
    "data": [
        {
            "name": "KMinerProxy",
            "local_port": 9999,
            "remote_address_raw": "tcp://asia2.ethermine.org:4444",
            "proxy_fee_info": {
                "raw_address": "tcp://asia2.ethermine.org:4444",
                "user_name": "",
                "password": "",
                "rate": 0.7
            },
            "start_time": "0001-01-01T00:00:00Z"
        }
    ]
}
```

```
{
"code":500,
"message":"some permission error info"
}
```

## 5.Delete Config by Port
method:``` DELETE ```

params: none

url:``` /config/{port} ```

return:```global config info```/```error message```

example:

DELETE ``` /config/9999 ```

```
{
    "code": 200,
    "data": [
        {
            "name": "KMinerProxy",
            "local_port": 9999,
            "remote_address_raw": "tcp://asia2.ethermine.org:4444",
            "proxy_fee_info": {
                "raw_address": "tcp://asia2.ethermine.org:4444",
                "user_name": "",
                "password": "",
                "rate": 0.7
            },
            "start_time": "0001-01-01T00:00:00Z"
        }
    ]
}
```

```
{
"code":500,
"message":"some permission error info"
}
```

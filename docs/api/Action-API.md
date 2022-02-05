该页面所有API均需要登陆
## 1.Stop Resolver

停止一个端口的实例、释放端口

注意：该API仅会从内存中读入信息，而不是从Config中，若想让修改的Config即时生效，请参照其他API

method:``` GET ```

params:none

url:``` /action/resolver/:port/stop```

return:```true ```/```error message```

example:
```
{
    "code": 200,
    "data": true
}
```

```
{
    "code": 500,
    "message": "此端口未发现运行实例"
}
```

## 2.Start Resolver
开启一个端口的实例、占用端口
（假如启动错误，应通过日志部分获得错误详细信息）

注意：该API仅会从内存中读入信息，而不是从Config中，若想让修改的Config即时生效，请参照其他API

method:``` GET ```

params:none

url:``` /action/resolver/:port/start```

return:```true ```/```error message```

example:
```
{
    "code": 200,
    "data": true
}
```

```
{
    "code": 500,
    "message": "此端口未发现运行实例"
}
```

## 3.Restart Resolver
重启一个端口的实例

注意：该API仅会从内存中读入信息，而不是从Config中，若想让修改的Config即时生效，请参照其他API

method:``` GET ```

params:none

url:``` /action/resolver/:port/restart```

return:```true ```/```error message```

example:
```
{
    "code": 200,
    "data": true
}
```

```
{
    "code": 500,
    "message": "此端口未发现运行实例"
}
```

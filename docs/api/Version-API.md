该页面所有API均需要登陆
## 1.Get Version
分别获得API协议版本和核心版本

method:``` GET ```

params:none

url:``` /version ```

return:```version info```/```error message```

example:
```
{
    "code": 200,
    "data": {
        "api": 100,
        "command": 100,
        "core": 100,
        "protocol": 100
    }
}
```
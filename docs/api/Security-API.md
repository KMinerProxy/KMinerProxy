任何权限不足或未登录的API均会返回：
```
{
    "code": 401,
    "message": "未登录"
}
```
解析后让用户返回登陆即可

## 1.Get Captcha
method:``` GET ```

params:none

url:``` /unsafe/captcha ```

return:``` base64 ```

example:
```
{"code":200,"data":"data:image/png;base64,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"}
```

## 2.Login
method:``` POST ```

url:``` /unsafe/login ```

params: 
```
{
"password":"password",
"captcha":"captcha"
}
```

return:``` result ```

example:
```
{
"code":500,
"message":"密码错误"
}
```

```
{
"code":500,
"message":"参数不足"
}
```


```
{
"code":500,
"message":"验证码错误"
}
```

```
{
"code":200,
"data":true
}
```


## 3.Logout
method:``` POST ```

url:``` /unsafe/logout ```

params:none

return:``` result ```

example:
```
{
"code":200,
"data":true
}
```

## 4.Verify Login
method:``` GET ```

url:``` /unsafe/verifyLogin ```

params:none

return:``` result ```

example:
```
{
"code":200,
"data":true
}
```

or

```
{
    "code": 401,
    "message": "未登录"
}
```
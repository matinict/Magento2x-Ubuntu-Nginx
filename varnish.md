## Varnish Install

```
apt-get install varnish -y
gedit /etc/default/varnish & >/dev/null
DAEMON_OPTS=""-a:80 \

gedit /etc/varnis/default.vcl & >/dev/null

backend default{
  .host = "127.0.0.1";
  .port = "8080";

}
```





## Varnish with NGINX





## Varnish with Apache 

``` 

systemctl restart apache2.service;
systemctl restart varnish.service;

ps aux | grep vcache
gedit /lib/systemd/system/varnish.service & >dev/null

ExecStart=/usr/sbin/varnishd -j unix,user=vcache -F -a:80 -T localhost:6082 -f /etc/varnish/default.vcl -S /etc/varnish/secret -s malloc,256m

systemctl daemon-reload;
systemctl restart apache2.service;
systemctl restart varnish.service;

curl -l http:ip
curl -l http://192.168.0.105
```

### Check varnish
```
varnishd -V
varnishhist
```



## Ref:
- [1](https://www.youtube.com/watch?v=tYAOeS88qTQ)

 


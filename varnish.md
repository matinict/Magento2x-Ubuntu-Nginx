## Install and configure Varnish

- Installing Varnish is as simple as running the following command:

```
sudo apt-get install varnish -y

```
- Config Magento Admin
From your Magento Admin dashboard click on the STORES==> Configuration -> ADVANCED -> System -> Full Page Cache Unselected Use system value and from the Caching Application list==> select Varnish Cache (Recommended)==>save the configuration, click on the Varnish Configuration link and click on the Export VCL for Varnish 4 button. The varnish.vcl file which we will use will be exported in the directory /var/www/myMagentoSite.com/var/.

Flush the Magento cache with:

```
php bin/magento cache:flush
```
- Delete the /etc/varnish/default.vcl and symlink it to the exported varnish configuration.
```
sudo rm -f /etc/varnish/default.vcl
sudo ln -sf /var/www/myMagentoSite.com/var/varnish.vcl /etc/varnish/default.vcl
```
- To change the varnish port from 6081 to 80, we need to edit the systemd service configuration.

Create a new customexec.conf file
```
sudo mkdir -p /etc/systemd/system/varnish.service.d
sudo nano /etc/systemd/system/varnish.service.d/customexec.conf
```

paste the following:

```
[Service]
ExecStart=
ExecStart=/usr/sbin/varnishd -j unix,user=vcache -F -a :80 -T localhost:6082 -f /etc/varnish/default.vcl -S /etc/varnish/secret -s malloc,256m
```

- Reload systemd units

```
sudo systemctl daemon-reload
```



## Varnish with NGINX


- Now we need to change Nginx listening port from 80 to 8080 and enable Nginx SSL termination with HTTP2, to do that open the Nginx configuration file and change it as follows:

```
sudo nano /etc/nginx/sites-available/myMagentoSite.com
```

```
upstream fastcgi_backend {
  server   unix:/run/php/php7.0-fpm.sock;
}

server {
    server_name myMagentoSite.com www.myMagentoSite.com;
    listen 8080;
    set $MAGE_ROOT /var/www/myMagentoSite.com;
    set $MAGE_MODE production; # or developer

    access_log /var/log/nginx/myMagentoSite.com-access.log;
    error_log /var/log/nginx/myMagentoSite.com-error.log;

    include /var/www/myMagentoSite.com/nginx.conf.sample;        
}

server {

    listen 443 ssl http2;
    server_name myMagentoSite.com www.myMagentoSite.com;

    ssl_certificate /etc/ssl/certs/ssl-cert-snakeoil.pem; # change with your SSL cert
    ssl_certificate_key /etc/ssl/private/ssl-cert-snakeoil.key; # change with your SSL key
    ssl_protocols              TLSv1 TLSv1.1 TLSv1.2;
    ssl_ciphers               'AES128+EECDH:AES128+EDH:!aNULL';
    ssl_session_cache    shared:SSL:10m;
    ssl_session_timeout 24h;
    keepalive_timeout 300s;

    location / {
        proxy_pass http://127.0.0.1;
        proxy_set_header Host $http_host;
        proxy_set_header X-Forwarded-Host $http_host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header Ssl-Offloaded "1";
        proxy_set_header      X-Forwarded-Proto https;
        proxy_set_header      X-Forwarded-Port 443;
        #proxy_hide_header X-Varnish;
        #proxy_hide_header Via;
        proxy_set_header X-Forwarded-Proto $scheme;

    }

}
```
- Restart Varnish and Nginx:

```
sudo systemctl restart nginx
sudo systemctl restart varnish
```

Change the base URL to https and flush the cache

```
sudo bin/magento setup:store-config:set --base-url="https://myMagentoSite.com"
sudo php bin/magento cache:flush
```

If everything is setup correctly now you should be able to login to your Magento back-end by going to 

https://myMagentoSite.com/admin



## Varnish with Apache 

``` 

gedit /etc/default/varnish & >/dev/null
DAEMON_OPTS=""-a:80 \

gedit /etc/varnis/default.vcl & >/dev/null

backend default{
  .host = "127.0.0.1";
  .port = "8080";

}
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
- [youtube1](https://www.youtube.com/watch?v=tYAOeS88qTQ)
- [rosehosting](https://www.rosehosting.com/blog/magento-2-with-redis-varnish-and-nginx-as-ssl-termination/)

 


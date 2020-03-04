## Install and configure Varnish

- Installing Varnish is as simple as running the following command:

```
sudo apt-get install varnish -y

```

After that you need to start Varnish. Use following commands to start Varnish and launch it at system boot:

```
sudo systemctl start varnish
sudo systemctl enable varnish
```
By default, Varnish is configured to listen on port 6081 for public access and 6082 for the backend.
You can check if Varnish is running and its port using netstat command:

```
netstat -plntu
```


## Config Magento Admin
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

### Check/Test Varnish 

How to check if varnish is working? Well, you should notice with your naked eyes that your website is now loading much faster.  If you need tools,  you can use following commands to test Varnish:

1. View Varnish access log with varnishncsa command:

```
varnishncsa
```
Start the command and access your website via web browser.

2. If you want detailed view for each request use varnishlog command:

```
varnishlog
```

```
varnishd -V
varnishhist
```

## Final verification
Now that you’re using the default.vcl generated for you by Magento, you can perform some final verifications to make sure Varnish is working.

Verify HTTP response headers Use curl or another utility to view HTTP response headers when you visit any Magento page in a web browser.

First, make sure you are using Magento’s developer mode; otherwise, you won’t see the headers.

For example,

curl -I -v --location-trusted 'http://magento.lan'
Important headers:

X-Magento-Cache-Control: max-age=86400, public, s-maxage=86400
Age: 0
X-Magento-Cache-Debug: MISS
This value is also acceptable: X-Magento-Cache-Debug: HIT.


### Clear Varnish Cache

1. Clear Varnish Cache with Magento 2
If you set varnish backend port and hosts correctly in Magento settings as described above in this article, then when you clean, flush, or refresh the Magento cache, Varnish purges as well. How Magento cache clearing works with Varnish

2. Clear entire Varnish Cache
In order to clear entire Varnish cache, you can simply restart Varnish:

```
sudo service varnish restart
```
Or

```
sudo systemctl restart varnish
```

3. How to clear varnish cache for specific URL
You can clear cache for specific page on your website using varnishadm:

```
varnishadm -T 127.0.0.1:6082 -S /etc/varnish/secret ban "req.http.host == https://yourdomain.com && req.url == /somepage/"
```
This will clear cache for https://yourdomain.com/somepage/





## Install and configure Redis caching
Redis is a key-value in memory data store and we will use it to replace the default Magento 2 Zend_Cache_Backend_File backend cache.  Install Redis by running the following command:

```
sudo apt-get install php-redis redis-server
```
To configure your Magento installation to use Redis for session storage open the app/etc/env.php file and change/add the following:
```
sudo nano /var/www/myMagentoSite.com/app/etc/env.php
```

```
change:
 'session' =>
  array (
    'save' => 'files',
  ),
 ```
with:
```
'session' => 
   array (
   'save' => 'redis',
   'redis' => 
      array (
	'host' => '127.0.0.1',
	'port' => '6379',
	'password' => '',
	'timeout' => '2.5',
	'persistent_identifier' => '',
	'database' => '0',
	'compression_threshold' => '2048',
	'compression_library' => 'gzip',
	'log_level' => '1',
	'max_concurrency' => '6',
	'break_after_frontend' => '5',
	'break_after_adminhtml' => '30',
	'first_lifetime' => '600',
	'bot_first_lifetime' => '60',
	'bot_lifetime' => '7200',
	'disable_locking' => '0',
	'min_lifetime' => '60',
	'max_lifetime' => '2592000'
    )
),
```
and to use Redis for page caching add:
```
'cache' =>
array(
   'frontend' =>
   array(
      'default' =>
      array(
         'backend' => 'Cm_Cache_Backend_Redis',
         'backend_options' =>
         array(
            'server' => '127.0.0.1',
            'port' => '6379'
            ),
    ),
    'page_cache' =>
    array(
      'backend' => 'Cm_Cache_Backend_Redis',
      'backend_options' =>
       array(
         'server' => '127.0.0.1',
         'port' => '6379',
         'database' => '1',
         'compress_data' => '0'
       )
    )
  )
),
```
Finally flush the cache again:

```
php bin/magento cache:flush

```
### Further Optimizations
To further optimize your Magento installation from you Magento admin dashboard:

1. Go to STORES -> Configuration -> CATALOG -> Catalog -> Use Flat Catalog Category, select Yes and click Save Config.
2. Go to STORES -> Configuration -> ADVANCED -> Developer -> JavaScript Settings and set both Merge JavaScript Files and Minify JavaScript Files to Yes and click Save Config..
3. Go to STORES -> Configuration -> ADVANCED -> Developer -> CSS Settings and set both Merge CSS Files and Minify CSS Files to Yes and click Save Config.
4. Consider using a CDN – Content Delivery Network

Do not forget to flush the cache:

  ```
  php bin/magento cache:flush
  ```

## Ref:
- [devdocs.magento.varnish.config](https://devdocs.magento.com/guides/v2.3/config-guide/varnish/config-varnish.html)
- [devdocs.magento.varnish.use](https://devdocs.magento.com/guides/v2.3/config-guide/varnish/use-varnish-cache.html)
- [youtube1](https://www.youtube.com/watch?v=tYAOeS88qTQ)
- [rosehosting](https://www.rosehosting.com/blog/magento-2-with-redis-varnish-and-nginx-as-ssl-termination/)
- [olegnax](https://olegnax.com/speed-up-magento-2-with-varnish-and-nginx-as-ssl-termination-on-ubuntu/)

 


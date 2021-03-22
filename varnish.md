## Install and configure Varnish 

		sudo apt-get install varnish -y 
		sudo systemctl start varnish
		sudo systemctl enable varnish
		netstat -plntu
		
 

[By default, Varnish is configured to listen on port 6081 for public access and 6082 for the backend]

## Config Magento Admin
From your Magento Admin dashboard click on the 

```
STORES==> Configuration -> ADVANCED -> System -> ==> select Varnish Cache (Recommended)==>save the configuration, 
click on the Varnish Configuration link and click on the Export VCL for Varnish 4 button.
The varnish.vcl file which we will use will be exported in the directory /var/www/magento.lan/var/.
```

 
	php bin/magento cache:flush

	- Delete the /etc/varnish/default.vcl and symlink it to the exported varnish configuration.
	sudo rm -f /etc/varnish/default.vcl
	sudo ln -sf /var/www/magento.lan/var/varnish.vcl /etc/varnish/default.vcl
 



## Varnish with NGINX


- Now we need to change Nginx listening port from 80 to 8080 and enable Nginx SSL termination with HTTP2, to do that open the Nginx configuration file and change it as follows:
 
		sudo nano /etc/nginx/sites-available/magento.lan

		upstream fastcgi_backend {
		  server   unix:/run/php/php7.0-fpm.sock;
		}

		server {
		    server_name myMagentoSite.com www.magento.lan;
		    listen 8080;
		    set $MAGE_ROOT /var/www/magento.lan;
		    set $MAGE_MODE production; # or developer

		    access_log /var/log/nginx/magento.lan-access.log;
		    error_log /var/log/nginx/magento.lanm-error.log;

		    include /var/www/magento.lan/nginx.conf.sample;        
		}

		server {

		    listen 443 ssl http2;
		    server_name magento.lan www.magento.lan;

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
		


		sudo systemctl restart nginx
		sudo systemctl restart varnish 
		php bin/magento setup:store-config:set --base-url="http://magento.lan"
		php bin/magento cache:flush
 

If everything is setup correctly now you should be able to login to your Magento back-end by going to 

https://magento.lan/admin



## Varnish with Apache: 

- To change the varnish port from 6081 to 80, 
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
//systemctl restart apache2.service;
systemctl restart varnish.service;

ps aux | grep vcache
gedit /lib/systemd/system/varnish.service & >dev/null
ExecStart=/usr/sbin/varnishd -j unix,user=vcache -F -a:80 -T localhost:6082 -f /etc/varnish/default.vcl -S /etc/varnish/secret -s malloc,256m
//systemctl daemon-reload;
//systemctl restart apache2.service;
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
varnishd -V
varnishhist
```

## Final verification
Now that you’re using the default.vcl generated for you by Magento, you can perform some final verifications to make sure Varnish is working. Verify HTTP response headers Use curl or another utility to view HTTP response headers when you visit any Magento page in a web browser.First, make sure you are using Magento’s developer mode; otherwise, you won’t see the headers.

For example,
	
	curl -I http://magento.lan
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

	sudo service varnish restart 
	sudo systemctl restart varnish


3. How to clear varnish cache for specific URL
You can clear cache for specific page on your website using varnishadm:

```
varnishadm -T 127.0.0.1:6082 -S /etc/varnish/secret ban "req.http.host == https://yourdomain.com && req.url == /somepage/"
```
This will clear cache for https://magento.lan/somepage/



### Further Optimizations
To further optimize your Magento installation from you Magento admin dashboard:

1. Go to STORES -> Configuration -> CATALOG -> Catalog -> Use Flat Catalog Category, select Yes and click Save Config.
2. Go to STORES -> Configuration -> ADVANCED -> Developer -> JavaScript Settings and set both Merge JavaScript Files and Minify JavaScript Files to Yes and click Save Config..
3. Go to STORES -> Configuration -> ADVANCED -> Developer -> CSS Settings and set both Merge CSS Files and Minify CSS Files to Yes and click Save Config.
4. Consider using a CDN – Content Delivery Network
Do not forget to flush the cache:

 
  	php bin/magento cache:flush
 

## Ref:
- [devdocs.magento.varnish.config](https://devdocs.magento.com/guides/v2.3/config-guide/varnish/config-varnish.html)
- [devdocs.magento.varnish.use](https://devdocs.magento.com/guides/v2.3/config-guide/varnish/use-varnish-cache.html)
- [youtube1](https://www.youtube.com/watch?v=tYAOeS88qTQ)
- [rosehosting](https://www.rosehosting.com/blog/magento-2-with-redis-varnish-and-nginx-as-ssl-termination/)
- [olegnax](https://olegnax.com/speed-up-magento-2-with-varnish-and-nginx-as-ssl-termination-on-ubuntu/)

 


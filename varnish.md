## Install and configure Varnish 

	sudo apt-get install varnish -y 
	sudo systemctl start varnish
	sudo systemctl enable varnish
	
	netstat -plntu
	netstat -nlpt
	netstat -tulpn
	
	sudo systemctl daemon-reload
	sudo systemctl restart varnish
	sudo systemctl restart nginx
	
	sudo systemctl status varnish
		
 

[By default, Varnish is configured to listen on port 6081 for public access and 6082 for the backend]

	sudo apt-get remove varnish -y 
	sudo apt-get remove --auto-remove varnish
	sudo apt-get purge varnish  -y 
	sudo apt-get purge --auto-remove varnish
	whereis varnish
	sudo rm -rf /etc/varnish/
	sudo apt clean
 	sudo apt autoremove
	

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
	sudo ln -sf /var/www/html/magento.lan/var/varnish.vcl /etc/varnish/default.vcl
 



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
		php bin/magento setup:store-config:set --base-url="http://www.magento.lan"
		php bin/magento setup:config:set --http-cache-hosts=127.0.0.1:8080	
		php bin/magento cache:flush
		
		
		magento setup:config:set   \
		--db-ssl-key=""  \
		--db-ssl-cert=""  \
		--db-ssl-ca=/path/tho/ca.pem  \
		--db-ssl-verify  \
		--session-save=db
		 
 

### Check/Test Varnish 

	varnishncsa 
	varnishlog
	varnishd -V
	varnishhist
 

## Final verification
Now that you’re using the default.vcl generated for you by Magento, you can perform some final verifications to make sure Varnish is working. Verify HTTP response headers Use curl or another utility to view HTTP response headers when you visit any Magento page in a web browser.First, make sure you are using Magento’s developer mode; otherwise, you won’t see the headers.
	
	curl -I http://www.magento.lan
	curl -k -I http://www.magento.lan
	curl -I http://www.magento.lan:80
	curl -I http://www.magento.lan:8080
	curl -I http://www.magento.lan:8081

	curl -I -v --location-trusted 'http://www.magento.lan'
	curl -I -v --location-trusted 'http://www.magento.lan/' > /dev/null | grep X-Magento

	X-Magento-Cache-Control: max-age=86400, public, s-maxage=86400
	Age: 0
	X-Magento-Cache-Debug: MISS
	
	[This value is also acceptable: X-Magento-Cache-Debug: HIT]
	
	
	rm -rf  var/page_cache/* 
	
	Check the var/page_cache/ directory.If the directory is empty, congratulations! 


### Clear Varnish Cache

1. Clear Varnish Cache with Magento 2
If you set varnish backend port and hosts correctly in Magento settings as described above in this article, then when you clean, flush, or refresh the Magento cache, Varnish purges as well. How Magento cache clearing works with Varnish

2. Clear entire Varnish Cache
In order to clear entire Varnish cache, you can simply restart Varnish:

	sudo service varnish restart 
	sudo systemctl restart varnish


3.flush the cache for a single domain in a multisite setup:
 
	varnishadm "ban req.http.host ==http://www.magento.lan"
	varnishadm -T 127.0.0.1:6082 -S /etc/varnish/secret ban "req.http.host == http://www.magento.lan && req.url == /"
 
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

 


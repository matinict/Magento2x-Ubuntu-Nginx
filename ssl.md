

## SSL Configuration

First of all we need an SSL certificate to handle HTTPS requests. We will use free Let’s Encrypt certificates. To obtain an SSL certificate we need to install the Certbot software on your server.

1. Install Certbot: Add Certbot’s repository & Install Nginx package with apt:

```
sudo apt-get update
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:certbot/certbot
sudo apt-get update
sudo apt-get install python-certbot-nginx

```

 

1.1. Create Server Block

You should already have server block for your domain /etc/nginx/sites-available/magento.lan with some basic configuration like server_name directive and Magento 2 root folder i.e.:

```
upstream fastcgi_backend {
     server  unix:/run/php/php7.2-fpm.sock;
}
server {
    server_name magento.lan
    listen 80;
    set $MAGE_ROOT /var/www/magento.lan;
    include /var/www/magento.lan/nginx.conf.sample;
}
```

* nginx.conf.sample is Nginx configuration file which comes with Magento.  You check how to install and configure Magento 2 on Nginx on Magento official website. If you have just created server block you need enable it:

```
sudo ln -s /etc/nginx/sites-available/magento.lan /etc/nginx/sites-enabled/
```

Test nginx configuration If everything is ok reload nginx :
 
```
sudo nginx -t
sudo systemctl reload nginx
```

Now Certbot will be able to find server block to add SSL configuration.

2. Allow HTTPS Through the Firewall.
If you have the ufw firewall enabled you’ll need allow HTTPS traffic & check the status using this command:

```
sudo ufw allow https
sudo ufw enable
sudo ufw status
```

3. Obtaining an SSL Certificate using certbot:

```
sudo certbot --nginx -d magento.lan

or 
sudo certbot --nginx -d www.magento.lan
```

Certbot will ask your email and if you are willing to redirect all requests to HTTPS. Choose No redirect, we will add it later in our configuration.

If Certbot will be able to find server block and verify that you are the owner of the domain for which you requested the certificate you will get a successful message:

```
 - Congratulations! Your certificate and chain have been saved at:
   /etc/letsencrypt/live/magento.lan/fullchain.pem
   Your key file has been saved at:
   /etc/letsencrypt/live/magento.lan/privkey.pem
   ...
 ```
You should have something like this in your server block after certificate is added:

```
server {
    server_name magento.lan;
    listen 80;
    set $MAGE_ROOT /var/www/magento.lan;
    include /var/www/magento.lan/nginx.conf.sample;

    listen 443 ssl;
    ssl_certificate /etc/letsencrypt/live/magento.lan/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/magento.lan/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}
```

Certbot will add certificates and include ssl configuration files to your server block.

## Enable SSL in Magento 2
After we have installed SSL certificates we need to configure Magento 2 to use secure URLs. It is better to do this before we configured HTTP to HTTPS redirection, because after that may not be able to access Magento admin panel.

- To do this login to Magento 2 admin panel and navigate to Stores > Configuration.
- Click Web under General menu and expand Base URLs (secure) section.
- Set your website secure URL and enable Use Secure URLs in Storefront and Use Secure URLs on Admin.
- We also suggest to enable HTTP Strict Transport Security and Upgrade Insecure Requests to avoid issues with mixed content.



## Ref
- [cloudbooklet](https://www.cloudbooklet.com/secure-nginx-with-lets-encrypt-ubuntu-18-04-google-cloud/)
- [olegnax](https://olegnax.com/speed-up-magento-2-with-varnish-and-nginx-as-ssl-termination-on-ubuntu/)
- [medium](https://medium.com/@mhagemann/how-to-secure-nginx-with-certbot-on-ubuntu-16-10-4a66956cd49c)



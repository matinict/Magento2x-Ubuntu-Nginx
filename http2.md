
## Http2 

Open the configuration file for your domain:

    sudo nano /etc/nginx/sites-available/your_domain
 
In the file, locate the listen variables associated with port 443:
your_domain’>/etc/nginx/sites-available/your_domain
    ...
    listen [::]:443 ssl ipv6only=on;
    listen 443 ssl;
    ...
 
The first one is for IPv6 connections. The second one is for all IPv4 connections. We will enable HTTP/2 for both.Modify each listen directive to include http2:

your_domain’>/etc/nginx/sites-available/your_domain
    ...
      listen [::]:443 ssl http2 ipv6only=on;
      listen 443 ssl http2;
    ...
 
This tells Nginx to use HTTP/2 with supported browsers.Save the configuration file and exit the text editor.
Whenever you make changes to Nginx configuration files, you should check the configuration for syntax errors, like this:

    sudo nginx -t
    sudo systemctl reload nginx



### Ref

https://www.digitalocean.com/community/tutorials/how-to-set-up-nginx-with-http-2-support-on-ubuntu-18-04

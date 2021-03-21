
## Http2 

### Step 1 — Enabling HTTP/2 Support

Open the configuration file for your domain:

    sudo nano /etc/nginx/sites-available/your_domain
 
In the file, locate the listen variables associated with port 443:
your_domain’>/etc/nginx/sites-available/your_domain
   
    listen [::]:443 ssl ipv6only=on;
    listen 443 ssl;
    
 
The first one is for IPv6 connections. The second one is for all IPv4 connections. We will enable HTTP/2 for both.Modify each listen directive to include http2:

your_domain’>/etc/nginx/sites-available/your_domain
     
      listen [::]:443 ssl http2 ipv6only=on;
      listen 443 ssl http2;
    
 
This tells Nginx to use HTTP/2 with supported browsers.Save the configuration file and exit the text editor.
Whenever you make changes to Nginx configuration files, you should check the configuration for syntax errors, like this:

    sudo nginx -t
    sudo systemctl reload nginx

### Step 2 — Removing Old and Insecure Cipher Suites

HTTP/2 has a blacklist of old and insecure ciphers, so we must avoid them. Cipher suites are cryptographic algorithms that describe how the transferred data should be encrypted.The method you’ll use to define the ciphers depends on how you’ve configured your TLS/SSL certificates for Nginx.

If you used Certbot to obtain your certificates, it also created the file /etc/letsencrypt/options-ssl-nginx.conf which contains ciphers which aren’t strong enough for HTTP/2. Modifying this file will unfortunately prevent Certbot from applying updates in the future, so we’ll just tell Nginx not to use this file and we’ll specify our own list of ciphers.

Open the server block configuration file for your domain:

    sudo nano /etc/nginx/sites-available/your_domain
Locate the line that includes the options-ssl-nginx.conf file and comment it out:

your_domain’>/etc/nginx/sites-available/your_domain
# include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot<^>
 
Below that line, add this line to define the allowed ciphers:

    your_domain’>/etc/nginx/sites-available/your_domain
    ssl_ciphers EECDH+CHACHA20:EECDH+AES128:RSA+AES128:EECDH+AES256:RSA+AES256:EECDH+3DES:RSA+3DES:!MD5;
 
Save the file and exit the editor.

If you used self-signed certificates or used a certificate from a third party and configured it according to the prerequisites, open the file /etc/nginx/snippets/ssl-params.conf in your text editor:

sudo nano /etc/nginx/snippets/ssl-params.conf
 
Locate the following line:

/etc/nginx/snippets/ssl-params.conf
...
ssl_ciphers ECDHE-RSA-AES256-GCM-SHA512:DHE-RSA-AES256-GCM-SHA512:ECDHE-RSA-AES256-GCM-SHA384:DHE-RSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-SHA384;
...
 
Modify it so it looks like this:

    /etc/nginx/snippets/ssl-params.conf
    ...
    ssl_ciphers EECDH+CHACHA20:EECDH+AES128:RSA+AES128:EECDH+AES256:RSA+AES256:EECDH+3DES:RSA+3DES:!MD5;

Save the file and exit your editor.

Once again, check the configuration for syntax errors:

    sudo nginx -t
 
If you see any errors, address them and test again.

Once you see no syntax errors, restart Nginx:

    sudo systemctl reload nginx
 
With the server restarted, let’s verify that it works.

### Step 3 — Verifying that HTTP/2 is Enabled
Let’s ensure the server is running and working with HTTP/2.
Use the curl command to make a request to your site and view the headers:

    curl -I -L https://your_domain
 
You’ll see the following output:

Output
HTTP/1.1 301 Moved Permanently
Server: nginx/1.14.0 (Ubuntu)
Date: Fri, 06 Jul 2018 19:07:12 GMT
Content-Type: text/html
Content-Length: 194
Connection: keep-alive
Location: https://your_domain/

HTTP/2 200
server: nginx/1.14.0 (Ubuntu)
date: Fri, 06 Jul 2018 19:07:12 GMT
content-type: text/html
content-length: 16
last-modified: Fri, 06 Jul 2018 16:55:37 GMT
etag: "5b3f9f09-10"
accept-ranges: bytes
You can also verify that HTTP/2 is in use in Google Chrome. Open Chrome and navigate to http://your_domain. Open the Chrome Developer Tools (View -> Developer -> Developer Tools) and reload the page (View -> Reload This Page). Navigate to the Network tab, right-click on the table header row that starts with Name, and select the Protocol option from the popup menu.

You’ll see h2 (which stands for HTTP/2) in a new Protocol column, indicating that HTTP/2 is working.

At this point, you’re ready to serve content through the HTTP/2 protocol. Let’s improve security and performance by enabling HSTS.

Step 4 — Enabling HTTP Strict Transport Security (HSTS)
Even though your HTTP requests redirect to HTTPS, you can enable HTTP Strict Transport Security (HSTS) to avoid having to do those redirects. If the browser finds an HSTS header, it will not try to connect to the server via regular HTTP again for a given time period. No matter what, it will exchange data using only encrypted HTTPS connection. This header also protects us from protocol downgrade attacks.

Open the Nginx configuration file in your editor:

sudo nano /etc/nginx/nginx.conf
Add this line to the file to enable HSTS:
/etc/nginx/nginx.conf
http {
...
    ##
    # Virtual Host Configs
    ##

    include /etc/nginx/conf.d/*.conf;
    include /etc/nginx/sites-enabled/*;
    add_header Strict-Transport-Security "max-age=15768000" always;
}
...
 
The max-age is set in seconds. The value 15768000 is equivalent to 6 months.

By default, this header is not added to subdomain requests. If you have subdomains and want HSTS to apply to all of them, you should add the includeSubDomains variable at the end of the line, like this:

/etc/nginx/nginx.conf
add_header Strict-Transport-Security "max-age=15768000; includeSubDomains" always;
 
Save the file, and exit the editor.

Once again, check the configuration for syntax errors:

sudo nginx -t
 
Finally, restart the Nginx server to apply the changes.

sudo systemctl reload nginx
 



### Ref

https://www.digitalocean.com/community/tutorials/how-to-set-up-nginx-with-http-2-support-on-ubuntu-18-04

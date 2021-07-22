

 # Install the softwares: 
 
        sudo apt-get update
        sudo apt-get -y install git wget curl nano unzip sudo vim net-tools openssh-server 
        sudo apt-get -y install nginx
        sudo service nginx start
        nginx -v    
        
        sudo ufw status 
        sudo ufw enable  
        sudo ufw allow 80/tcp 
        sudo ufw allow 8080/tcp      
        sudo ufw allow 443/tcp   
        sudo ufw allow https
        sudo ufw allow 'Nginx HTTPS'        
        sudo ufw allow 7100:7200/tcp
        sudo ufw allow 7100:7200/udp
        
        sudo ufw allow from 64.63.62.61
        
        sudo ufw allow from 64.63.62.61 to any port 22
        
        sudo ufw status numbered
        
      ```  
      Status: active

           To                         Action      From
           --                         ------      ----
      [ 1] 443/tcp                    ALLOW IN    Anywhere
      [ 2] 80/tcp                     ALLOW IN    Anywhere
      [ 3] 443/tcp (v6)               ALLOW IN    Anywhere (v6)
      [ 4] 80/tcp (v6)                ALLOW IN    Anywhere (v6)
      ```
If you do not have a domain name pointed at your server and you do not know your server’s public IP address, you can find it by running the following command:

    ip addr show eth0 | grep inet | awk '{ print $2; }' | sed 's/\/.*$//' 
    curl -4 icanhazip.com 
    http://server_domain_or_IP


# Permission 

    sudo mkdir /var/www/html/mysite
    sudo chown $USER:www-data /var/www/html/mysite
    sudo chmod g+s /var/www/html/mysite
    sudo chmod o-rwx /var/www/html/mysite
    
    
##  How to see a list of www-data members

    grep ^www-data /etc/group

Sample outputs: www-data:x:33:

## How do I add an existing user named matin to group Apache group www-data?
Simply run the following command to add an existing user to an existing group:

    sudo adduser {USER-NAME-HERE} {GROUP-NAME-HERE}
    sudo adduser matin www-data         
    ## Add a new user to the www-data group 
    sudo useradd -g www-data matin
    ### set the password for matin user ###
    sudo passwd matin

## Live Server Config with https
 - Remove /etc/nginx/sites-available/default
 -  create  /etc/nginx/sites-available/domain

 ```
   upstream fastcgi_backend {
     server  unix:/run/php/php7.2-fpm.sock;
   }

   server {
       listen 443 ssl;
       ssl_certificate     /etc/nginx/ssl/bundle.crt;
       ssl_certificate_key /etc/nginx/ssl/private.key;
       server_name domain.com www.domain.com;
       set $MAGE_ROOT /var/www/prod/magento2;
       include /var/www/prod/magento2/nginx.conf.sample;
   }

   server {
       listen 80;
       server_name domain.com www.domain.com;
       #set $MAGE_ROOT /var/www/prod/magento2;
       #location /.well-known/pki-validation/4D94A304AD65F8463B3EE2992F34C0CA.txt {
       #    alias /var/www/prod/magento2/4D94A304AD65F8463B3EE2992F34C0CA.txt;
       #}
       #include /var/www/prod/magento2/nginx.conf.sample;
       return 301 https://domain.com$request_uri;
   }
 ```
 ## Inside Magento Run PHP
 
    nano /etc/nginx/sites-available/magento_stage 
 
    server {
      listen 80;
      #    ssl_certificate /etc/letsencrypt/live/stage.ecom.domain.com/fullchain.pem; # managed by Certbot
      #    ssl_certificate_key /etc/letsencrypt/live/stage.ecom.domain.com/privkey.pem; # managed by Certbot
      #    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
      #    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

      server_name stage.domain.com;
      set $MAGE_ROOT /var/www/stage/magento2-stage2;
      include /var/www/stage/magento2-stage2/nginx.conf.sample;


          ## Allow pub/scripts/ folder to execute php custom
         location /scripts/ {
          location ~* \.php$ {
                  try_files $uri =404;
                  fastcgi_pass   fastcgi_backend;
                  fastcgi_buffers 1024 4k;

                  fastcgi_read_timeout 600s;
                  fastcgi_connect_timeout 600s;

                  fastcgi_index  index.php;
                  fastcgi_param  SCRIPT_FILENAME  $document_root$fastcgi_script_name;
                  include        fastcgi_params;
                 }
          }



     }





## Troubleshooting Point Nginx


#### Nginx Config 

    /etc/nginx/nginx.conf
 

### Nginx Error Log File

    cat /var/log/nginx/error.log
    cat /var/log/nginx/access.log
    
    sudo truncate -s 0 error.log
    sudo truncate -s 0 access.log
    
    
 #### Custom Configuration :

    sudo nano etc/nginx/conf.d/magento.conf 
    
    upstream fastcgi_backend {
      server  127.0.0.1:9000;
    }
    server {
      listen 8085;
      server_name 192.168.1.64:8085;
      set $MAGE_ROOT /usr/share/nginx/html/magento;
      include /usr/share/nginx/html/magento/nginx.conf.sample;

      error_log /var/log/nginx/magento_error.log;
      access_log /var/log/nginx/magento_access.log;
    }
    
    
     cat /var/log/nginx/magento_error.log|less;
     cat /var/log/nginx/magento_access.log|less;
    
 ### Xdubug iisue
 
    sudo phpdismod xdebug
    sudo service php7.2-fpm restart
    
## Problem List

### Problem-01 : [emerg]: bind() to 0.0.0.0:80 failed (98: Address already in use)
If you get following error, when you try to start nginx…[emerg]: bind() to 0.0.0.0:80 failed (98: Address already in use)
Then it means nginx or some other process is already using port 80. You can kill it using:And then try restarting nginx again
 
    sudo fuser -k 80/tcp 
    sudo fuser -k 443/tcp
    sudo service nginx start
    # or
    nginx -t -c /etc/nginx/nginx.conf 
    ps -eaf |grep nginx 
    sudo cat /var/log/nginx/error.log|less 
    //ps -eaf |grep nginx and netstat -tulpn |grep 80 a
    //kill -9 749 
    grep -r 'listen ' /etc/nginx/* 
 

### Problem-02: [warn] could not build optimal proxy_headers_hash, 

you should increase either proxy_headers_hash_max_size: 512 or proxy_headers_hash_bucket_size: 64; ignoring proxy_headers_hash_bucket_size


### Problem-03: EOF Showing NGINX


Server showing EOF text , Posiiblbe cause as below

-  Ip of Host not valid/accesable
-  check localhost using VPN
 

### Problem-04:  Customer Login Issue 


     #fastcgi_buffers 1024 4k;
     fastcgi_buffers 11024 16k;
     fastcgi_buffer_size 32k;


 
 ## Ref 
 
 

# Magento2x-Ubuntu-Nginx

How to install Magento 2.3 on Ubuntu with Nginx.

Development Environment:

     Magento 2.3.x
     nginx/1.14.x
     PHP 7.2.x
     MySQL 5.7
     Ubuntu 18.04
  
 
 I am going to show everybody the best practice, How to install Magento 2.3x on Ubuntu with Nginx.
 I will show everybody steps by step to install Magento 2.3x on Ubuntu 18.04 with Nginx 1.10.x, PHP 7.2.x and MySQL 5.7.
 

Okie, let's go.Let's do this practice, you need to follow steps by step:

# Step 1: Installing the server. 

    - cat /etc/*release (check your current Ubuntu version)
    I have Ubuntu 18.04 on my localhost.
    - You can check the requirements system for Magento 2.3 in the 
    link https://devdocs.magento.com/guides/v2.3/install-gde/prereq/nginx.html    
    
   # 1.1- Install the softwares: [Advanced Nginx](https://github.com/matinict/Magento2x-Ubuntu-Nginx/blob/master/nginx.md) 
    
    
      apt-get update
      apt-get -y install git wget curl nano unzip sudo vim net-tools openssh-server
      - Install the Nginx 1.10.x: 
      apt-get -y install nginx
      service nginx start
      nginx -v
      
    1.2- Install PHP 7.2.x and the required PHP extensions: 
      apt-get install software-properties-common
      add-apt-repository ppa:ondrej/php
      apt-get update
      apt-cache search php7.2
      apt-get install php7.2 libapache2-mod-php7.2 php7.2-common php7.2-gd php7.2-mysql php7.2-curl php7.2-intl php7.2-xsl php7.2-mbstring php7.2-zip php7.2-bcmath php7.2-soap php-xdebug php-imagick
      
      php -v
      - Install PHP 7.2 FPM:
      apt-get install php7.2-fpm
      nano /etc/php/7.2/fpm/php.ini
      press ctrl + w for searching
      press ctrl + shift+v for past &  Enter Search
       
      memory_limit = 2G
      max_execution_time = 3600
      max_input_time = 1800
      upload_max_filesize = 10M
      zlib.output_compression = On
      press ctrl + O for saving or Ctrl+x
      service php7.2-fpm start
      
           
    1.3- Install Composer:
      curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
      composer --version
      
      
   # 1.4- Install MySQL 5.7  
   
   [Mysql & PhpMyAdmin](https://github.com/matinict/Magento2x-Ubuntu-Nginx/blob/master/phpmyadmin.md) 
    
    
      apt-get install -y mysql-server mysql-client
      enter the password for the root user: giaphugroup
      service mysql start
      mysql_secure_installation
      SHOW VARIABLES LIKE "%version%";
       
       sudo mysql -u root -p

          
    1.5- Install phpMyAdmin
      Create the new folder named phpmyadmin in the path /var/www/html/
      mkdir phpmyadmin

      Download phpMyAdmin: 
      wget https://files.phpmyadmin.net/phpMyAdm...
      unzip phpMyAdmin-4.8.5-all-languages.zip

   1.6-Create a new virtual host for accessing to phpmyadmin
    
      nano /etc/nginx/sites-available/phpmyadmin
      server {
          listen 9000;
          root /var/www/html/phpmyadmin/phpMyAdmin-4.8.5-all-languages;
          server_name localhost;
          index index.php index.html index.htm;

          location / {
             try_files $uri $uri/ /index.php?$args;
          }

          location ~ \.php$ {
             include snippets/fastcgi-php.conf;
             fastcgi_pass unix:/run/php/php7.2-fpm.sock;
          }
          location ~ /\.ht {
             deny all;
          }
      }
     ln -s /etc/nginx/sites-available/phpmyadmin /etc/nginx/sites-enabled
      - Restart Nginx:
      nginx -t
      service nginx restart
      netstat -plnt
      
     3306 is of mysql service
     9000 of the phpmyadmin site

# Step 2: Install and configure Magento 2.3.2

    - Create the Magento authentication keys: https://marketplace.magento.com/
    - Create the new database named magento2_3_0: http://localhost:9000
    - cd /var/www/html
    -composer create-project --repository=https://repo.magento.com/ magento/project-community-edition <install-directory-name>
    [ composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition=2.3.2 magento2.3.2]
    - cd magento2.3.2
    find var generated vendor pub/static pub/media app/etc -type f -exec chmod g+w {} +
    find var generated vendor pub/static pub/media app/etc -type d -exec chmod g+ws {} +
    chown -R :www-data .
    chmod u+x bin/magento
    php bin/magento setup:di:compile
    - Create a new virtual host for accessing to the Magento2.3.2 site
    nano /etc/nginx/sites-available/magento2.3.2
    upstream fastcgi_backend {
        server unix:/run/php/php7.2-fpm.sock;
    }

    server {
        listen 86;
        server_name localhost;
        set $MAGE_ROOT /var/www/html/magento2.3.2;
        include /var/www/html/magento2.3.2/nginx.conf.sample;
    }
    ln -s /etc/nginx/sites-available/magento2.3.2 /etc/nginx/sites-enabled
    - Restart Nginx:
    nginx -t
    service nginx restart
    netstat -plnt
    86 is of the magento 2.3.2 site.

    - Install Magento 2.3.2: http://localhost:86
    - cd /var/www/html/magento2.3.2
    php bin/magento setup:static-content:deploy -f
    
 
 
 


# Step 3: Nginx server blocks (Virtual Hosts)
          --Multiple Subdomain of Nginx Server
          
          
          - cd /var/www/html
          -composer create-project --repository=https://repo.magento.com/ magento/project-community-edition magento.lan
          - cd magento.lan
          find var generated vendor pub/static pub/media app/etc -type f -exec chmod g+w {} +
          find var generated vendor pub/static pub/media app/etc -type d -exec chmod g+ws {} +
          chown -R :www-data .
          chmod u+x bin/magento
          php bin/magento setup:di:compile
          
          
         /etc/nginx/sites-available/default. Let's take a look at it:
         *** Remove below code from all site except default otherwise show error**
         $ cp /etc/nginx/sites-available/default /etc/nginx/sites-available/default.bak
         $ sudo nano /etc/nginx/sites-available/default
         
         upstream fastcgi_backend {
               server unix:/run/php/php7.2-fpm.sock;
          }

          # Default server configuration
        
          server {
               listen 80 default_server;
               listen [::]:80 default_server;

               # SSL configuration
               #
               # listen 443 ssl default_server;
               # listen [::]:443 ssl default_server;
               #
               # Note: You should disable gzip for SSL traffic.
               # See: https://bugs.debian.org/773332
               #
               # Read up on ssl_ciphers to ensure a secure configuration.
               # See: https://bugs.debian.org/765782
               #
               # Self signed certs generated by the ssl-cert package
               # Don't use them in a production server!
               #
               # include snippets/snakeoil.conf;

               root /var/www/html;

               # Add index.php to the list if you are using PHP
               index index.php index.html index.htm index.nginx-debian.html;

               server_name _;

               location / {
                    # First attempt to serve request as file, then
                    # as directory, then fall back to displaying a 404.
                    try_files $uri $uri/ =404;
               }

               # pass PHP scripts to FastCGI server
               #
               #location ~ \.php$ {
               #	include snippets/fastcgi-php.conf;
               #
               #	# With php-fpm (or other unix sockets):
               #	fastcgi_pass unix:/var/run/php/php7.2-fpm.sock;
               #	# With php-cgi (or other tcp sockets):
               #	fastcgi_pass 127.0.0.1:9000;
               #}

               # deny access to .htaccess files, if Apache's document root
               # concurs with nginx's one
               #
               #location ~ /\.ht {
               #	deny all;
               #}
               location /phpmyadmin {
                root /usr/share/;
               index index.php;
                try_files $uri $uri/ =404;

               location ~ ^/phpmyadmin/(doc|sql|setup)/ {
               deny all;
                    }

               location ~ /phpmyadmin/(.+\.php)$ {
               fastcgi_pass unix:/var/run/php/php7.2-fpm.sock;
               fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
               include fastcgi_params;
               include snippets/fastcgi-php.conf;
                    }	
               }


          }
          
          $sudo nano /etc/nginx/sites-available/magento.lan 
          server {
              listen 80;
              server_name www.magento.lan;
              set $MAGE_ROOT /var/www/html/magento.lan;
              include /var/www/html/magento.lan/nginx.conf.sample;
               }
               
           $ sudo nginx -t  
           $ sudo nano /etc/hosts
           
           127.0.0.1	localhost
           Host File Content Like That:
           
               127.0.1.1	matin-U18 
               127.0.0.1	www.magento.lan 
           
          $ sudo ln -s /etc/nginx/sites-available/magento.lan /etc/nginx/sites-enabled
          $ sudo systemctl restart nginx
          
          http://www.magento.lan/setup
          
          [In your browser Complete Install]

          
# Step 4: Sample Data Install using Composer:  

   [More Details sampledata](https://github.com/matinict/Magento2x-Ubuntu-Nginx/blob/master/sampledata.md) 
  
    cd /var/www/html/magento.lan
    php bin/magento sampledata:deploy
     Authentication required (repo.magento.com): if ask cmd
     Username: xxxxx
     Pasward: xxx

    php bin/magento setup:upgrade
          
          
          


# Instruction *
 
 ** If Any Command not work or errror something use # sudo { sudo apt-get update }


# Ref##

  https://devdocs.magento.com/guides/v2.3/install-gde/prereq/nginx.html
  
  https://devdocs.magento.com/guides/v2.3/install-gde/composer.html
  
  https://www.server-world.info/en/note?os=Ubuntu_18.04&p=nginx&f=1
  
  https://linuxconfig.org/how-to-setup-the-nginx-web-server-on-ubuntu-18-04-bionic-beaver-linux
  
  https://www.howtoforge.com/tutorial/how-to-install-nginx-with-php-and-mysql-lemp-on-ubuntu-1804/
  
  https://www.simicart.com/blog/magento-2-composer/
  
  https://youtu.be/Z34udaRg4mE
  
  https://www.youtube.com/watch?v=HGWGiSuarfU
  
  https://www.youtube.com/watch?v=cf0q0AfkKQw
  
  https://www.youtube.com/watch?v=whzgC8Lc6IA
  
  https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mysql-php-lemp-stack-in-ubuntu-16-04
  
  https://medium.com/@chiragpatel_52497/install-magento-2-x-on-ubuntu-18-04-with-nginx-mariadb-php-7-1-programming-school-e13476bb0c3f
  
  https://devdocs.magento.com/guides/v2.3/install-gde/install/sample-data-after-composer.html

  https://www.cloudways.com/blog/how-to-install-sample-data-in-magento-2/
  

   Thank you for watching guide.If you have any questions about this practice, 
   please feel free to leave a comment or hangout:matinict@gmail.com.
   Please do not hesitate to contact me don't worry about charge I try to help free on my little knowledge,
   if you need me to join your Magento project especially extension developer.
   My rate is $20/hour in Magento 1 and $25/hour in Magento 2x.

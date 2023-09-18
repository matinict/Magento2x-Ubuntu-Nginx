# Magento2x-Ubuntu-Nginx

How to install Magento 2.3x or 2.4x on Ubuntu with Nginx. Development Environment:

     Magento 2.3x / 2.4x
     nginx/1.14.x
     PHP 7.2x -7.4x
     MySQL 5.7-8x
     Ubuntu 18.04-20.04
  
  

## Step 1.0: Installing the server. 

    - cat /etc/*release (check your current Ubuntu version)
    I have Ubuntu 18.04 on my localhost.
    - You can check the requirements system for Magento 2.3 in the 
    link https://devdocs.magento.com/guides/v2.3/install-gde/prereq/nginx.html    
    
## 1.1- Install the softwares: [Advanced Nginx](https://github.com/matinict/Magento2x-Ubuntu-Nginx/blob/master/nginx.md) 
    
    
      sudo apt-get update
      sudo apt-get -y install git wget curl nano unzip sudo nano net-tools openssh-server
      sudo apt-get -y install nginx
      sudo service nginx start
      nginx -v
      sudo ufw app list
      sudo ufw allow 'Nginx HTTP'
      curl -4 icanhazip.com
      
## 1.2- Install PHP 7.2.x and the required PHP extensions: [PHP7x](PHP7x.md)
   
      sudo apt-get install software-properties-common
      sudo add-apt-repository ppa:ondrej/php
      sudo apt-get update
      sudo apt-cache search php7.2
      sudo apt-get install php7.2 libapache2-mod-php7.2 php7.2-common php7.2-gd php7.2-mysql php7.2-curl php7.2-intl php7.2-xsl php7.2-mbstring php7.2-zip php7.2-bcmath php7.2-soap php-xdebug php-imagick 
      sudo apt-get -y install php7.2-fpm
      
      
     sudo nano /etc/php/7.2/fpm/php.ini
     sudo nano /etc/php/7.3/fpm/php.ini
     sudo nano /etc/php/7.4/fpm/php.ini
     
      press ctrl + w for searching
      press ctrl + shift+v for past &  Enter Search
       
      memory_limit = 4G
      max_execution_time = 3600
      max_input_time = 1800
      upload_max_filesize = 10M
      zlib.output_compression = On
      max_input_vars = 81000

      press ctrl + O for saving or Ctrl+x
      
      sudo service php7.2-fpm start
      
           
## 1.3- Install Composer:
    
      curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
      composer --version
      
      
## 1.4- Install MySQL 5.7  [mysql](mysql.md)
   
   [Mysql & PhpMyAdmin](https://github.com/matinict/Magento2x-Ubuntu-Nginx/blob/master/phpmyadmin.md) 
    
    
           
     Install MySQL using the apt command below:
          sudo apt install mysql-server mysql-client -y
          enter the password for the root user: giaphugroup
          service mysql start
          mysql_secure_installation
          SHOW VARIABLES LIKE "%version%"; 
          sudo mysql -u root -p
 
     After the MySQL installation is complete, start the MySQL service and enable it to launch everytime at system boot.
          systemctl start mysql
          systemctl enable mysql

          
## 1.5- Install phpMyAdmin
   
    install PHPMyAdmin using the apt command below.
     sudo apt install phpmyadmin -y
     During the installation, it will ask you about the web server configuration for phpmyadmin.
     Choose none option and move the cursor to: 'OK'.
     For the phpmyadmin database configuration: choose 'Yes'
     And type new 'STRONG' phpmyadmin admin such as 'Hakaselabs001@#'.

     Enter a password: "PhpMyAdmin@123"
     Repeat the "PhpMyAdmin@123" password.

## 1.6-Create a new virtual host for accessing to phpmyadmin
    
        
         sudo  nano /etc/nginx/sites-available/default
         Paste the following Nginx configuration for phpmyadmin inside the 'server {...}' bracket.

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
     Save and exit.
     
      Test the nginx configuration and restart the nginx service.
     nginx -t
     systemctl reload nginx
     And we've added the Nginx configuration for phpmyadmin.
     Login to the MySQL shell.

     mysql -u root -p
     Now create a new user using the MySQL queries below.

     create user phpmyadmin@'localhost' identified by 'PhpMyAdmin@123';
     grant all privileges on *.* to phpmyadmin@'localhost' identified by 'PhpMyAdmin@123';
     flush privileges;
     exit;

     Test Login PhpMyAdmin
     On the web browser, type the following phpmyadmin URL (replace the IP with your server IP).

     http://127.0.0.1/phpmyadmin/


## Step 2: Install and configure Magento 2.3.x

    - Create the Magento authentication keys: https://marketplace.magento.com/
    - Create the new database named magento2_3_0: http://localhost:9000
    - cd /var/www/html
    -composer create-project --repository=https://repo.magento.com/ magento/project-community-edition <install-directory-name>
    [ composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition=2.3.x magento2.3.x]
    - cd magento2.3.2
    find var generated vendor pub/static pub/media app/etc -type f -exec chmod g+w {} +
    find var generated vendor pub/static pub/media app/etc -type d -exec chmod g+ws {} +
    chown -R :www-data .
    chmod u+x bin/magento
    php bin/magento setup:di:compile
    - Create a new virtual host for accessing to the Magento2.3.x site
    nano /etc/nginx/sites-available/magento2.3.x
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
    
 
 
 


## Step 3: Nginx server blocks (Virtual Hosts)
          --Multiple Subdomain of Nginx Server
          
          
          - cd /var/www/html
          composer create-project --repository=https://repo.magento.com/ magento/project-community-edition magento.lan

          sudo chown $USER:www-data /var/www/html/magento.lan
          sudo chmod g+s /var/www/html/magento.lan
          sudo chmod o-rwx /var/www/html/magento.lan
          
          cd magento.lan
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
          
          [ sudo unlink /etc/nginx/sites-enabled/default ]
          
          # Resart ALL
          sudo systemctl restart nginx
          sudo service php7.2-fpm restart
          sudo service mysql restart
          sudo systemctl restart mysql.service 
          
          http://www.magento.lan/setup
          
          [In your browser Complete Install]

          php bin/magento setup:install \
          --base-url=http://www.magento.lan \
          --db-host=localhost \
          --db-name=mag246db \
          --db-user=matin \
          --db-password=matin@123 \
          --admin-firstname=Matin \
          --admin-lastname=Admin \
          --admin-email=matinict@gmail.com \
          --admin-user=admin \
          --admin-password=admin@123 \
          --language=en_US \
          --currency=USD \
          --timezone=America/Chicago \
          --use-rewrites=1

          
## Step 4: Sample Data Install using Composer:  

   [More Details sampledata](https://github.com/matinict/Magento2x-Ubuntu-Nginx/blob/master/sampledata.md) 
  
     cd /var/www/html/magento.lan
     php bin/magento sampledata:deploy
     Authentication required (repo.magento.com): if ask cmd
     Username: xxxxx
     Pasward: xxx
     
     php bin/magento setup:upgrade
     
     #For remove:
     
     php php bin/magento sampledata:remove
     
     
     [https://marketplace.magento.com/customer/accessKeys/ login then copy Public & private Key]
     
     Ex.
     
     Public Key: 2c534578b8507d00e7f927af2591756d Copy
     Private Key: 8819e8bf8336c7ada213ee2df18f5c15 Copy



 
 

 ## Step 4: Install Magento 2 PWA Studio

      #git clone https://github.com/magento-research/pwa-studio.git
      yarn create @magento/pwa
      
      cd pwa-studio/
      yarn install
      
      # npx @magento/pwa-buildpack create-env-file packages/venia-concept
      cp packages/venia-concept/.env.dist packages/venia-concept/.env
      MAGENTO_BACKEND_URL="http://www.magento.lan/"
      
      yarn buildpack create-custom-origin packages/venia-concept
      bash deployVeniaSampleData.sh
      bin/magento setup:upgrade
      bin/magento indexer:reindex
      bin/magento cache:flush

      yarn install
      yarn watch

     npm run clean:all
     npm install
     npm run build


# Ref##

  https://webkul.com/blog/magento2-3-pwa-studio-setup/

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
   
   
   ### **Author:**

#### _**Matin**_

[![image](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/matinr/)

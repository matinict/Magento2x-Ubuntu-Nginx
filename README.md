# Magento2x-Ubuntu-Nginx
How to install Magento 2.3 on Ubuntu with Nginx.

 [instruction](https://github.com/matinict/Magento2x-Ubuntu-Nginx/blob/master/instruction.text) for  detailed informations. 
 
 
 I am going to show everybody the best practice, How to install Magento 2.3x on Ubuntu with Nginx.
I will show everybody steps by step to install Magento 2.3x on Ubuntu 18.04 with Nginx 1.10.x, PHP 7.2.x and MySQL 5.7.

Okie, let's go.Let's do this practice, you need to follow steps by step:

# Step 1: Installing the server. 

    - cat /etc/*release (check your current Ubuntu version)
    I have Ubuntu 18.04 on my localhost.
    - You can check the requirements system for Magento 2.3 in the link https://devdocs.magento.com/guides/v2.3/install-gde/prereq/nginx.html    
    
    1.1- Install the softwares: [nginx](https://github.com/matinict/Magento2x-Ubuntu-Nginx/blob/master/nginx.md) 
    
    
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
      
    1.3- Install MySQL 5.7
      apt-get install -y mysql-server mysql-client
      enter the password for the root user: giaphugroup
      service mysql start
      mysql_secure_installation
      SHOW VARIABLES LIKE "%version%";
    1.4- Install Composer:
      curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
      composer --version
      
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
    
  
# Instruction *
 
 ** If Any Command not work or errror something use # sudo { sudo apt-get update }


# Ref##

  https://devdocs.magento.com/guides/v2.3/install-gde/prereq/nginx.html
  
  https://devdocs.magento.com/guides/v2.3/install-gde/composer.html
  
  https://linuxconfig.org/how-to-setup-the-nginx-web-server-on-ubuntu-18-04-bionic-beaver-linux
  
  https://www.howtoforge.com/tutorial/how-to-install-nginx-with-php-and-mysql-lemp-on-ubuntu-1804/
  
  https://www.simicart.com/blog/magento-2-composer/
  
  https://www.youtube.com/watch?v=cf0q0AfkKQw
  

 

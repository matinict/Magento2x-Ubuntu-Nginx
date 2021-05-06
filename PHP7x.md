# Play with Multi php 


## Install PHP 8.0/7.3/7.2/7.1/7.0 on Ubuntu 18.04/20.4
        sudo apt update
        sudo apt upgrade
        sudo apt-get install software-properties-common
        #sudo add-apt-repository ppa:ondrej/php

        sudo add-apt-repository ppa:ppa:ondrej/nginx-mainline      
        sudo add-apt-repository ppa:ppa:ondrej/nginx
        sudo apt-get update 

        # Once the PPA is enabled, you can install PHP 8. 
        sudo apt install php8.0-mysql php8.0-gd
        sudo apt install php8.0-fpm
        sudo apt install php8.0-snmp php-memcached php8.0-mysql
        sudo apt install php8.0-common php8.0-mysql php8.0-xml php8.0-curl php8.0-gd php8.0-imagick php8.0-cli php8.0-dev php8.0-imap php8.0-mbstring php8.0-opcache php8.0-soap php8.0-zip -y
        
        


        ##7.4 on Ubuntu 20.4 
        sudo apt update
        sudo apt -y install php7.4
        sudo apt-get -y install php7.4-fpm
        sudo apt -y install php7.4-common php7.4-mysql php7.4-xml php7.4-xmlrpc php7.4-curl php7.4-gd php7.4-imagick php7.4-cli php7.4-dev php7.4-imap php7.4-mbstring php7.4-opcache php7.4-soap php7.4-zip php7.4-intl
        sudo php-fpm7.4 -t 
       

        ##7.4 on Ubuntu 18.04/16.04 
        sudo apt -y install php7.4 
        sudo apt-get -y install php7.3-fpm
        sudo apt install php7.4-common php7.4-mysql php7.4-xml php7.4-xmlrpc php7.4-curl php7.4-gd php7.4-imagick php7.4-cli php7.4-dev php7.4-imap php7.4-mbstring php7.4-opcache php7.4-soap php7.4-zip php7.4-intl -y
        
        

        # 7.3
        sudo apt-get install -y php7.3 
        sudo apt-get -y install php7.3-fpm
        sudo apt-get install -y php7.3 php7.3-fpm php7.3-mysql  -y
        sudo apt install -y php7.3-common php7.3-mysql php7.3-xml php7.3-xmlrpc php7.3-curl php7.3-gd php7.3-imagick php7.3-cli php7.3-dev php7.3-imap php7.3-mbstring php7.3-opcache php7.3-soap php7.3-zip php7.3-intl -y
        


        ## 7.2
        sudo apt-get install -y php7.2
        sudo apt-get -y install php7.2-fpm         
        sudo apt-get install -y  php7.2   php7.2-common php7.2-gd php7.2-mysql php7.2-curl php7.2-intl php7.2-xsl php7.2-mbstring php7.2-zip php7.2-bcmath php7.2-soap php-xdebug php-imagick 
         

        #7.1
        sudo apt-get install -y php7.1
        sudo apt-get -y install php7.1-fpm
        sudo apt-get install -y php7.1  php7.1-common php7.1-gd php7.1-mysql php7.1-curl php7.1-intl php7.1-xsl php7.1-mbstring php7.1-zip php7.1-bcmath php7.1-soap php-xdebug php-imagick  
        

        #7.0
        sudo apt-get install -y php7.0 
        sudo apt-get -y install php7.0-fpm
        sudo apt-get install -y  php7.0  php7.0-common php7.0-gd php7.0-mysql php7.0-curl php7.0-intl php7.0-xsl php7.0-mbstring php7.0-zip php7.0-bcmath php7.0-soap php-xdebug php-imagick 
        
        

        # configurations 
        sudo nano /etc/php/7.x/fpm/php.ini
        # press ctrl + w for searching
        # press ctrl + shift+v for past &  Enter Search
        memory_limit = 4G
        max_execution_time = 3600
        max_input_time = 1800
        upload_max_filesize = 100M
        zlib.output_compression = On
        session.gc_maxlifetime = 991440
        max_input_vars = 81000

        # press ctrl + O for saving or Ctrl+x    
        
        
        
        ## Restart php-fpm & Chk version
        sudo service php7.x-fpm restart      
        sudo systemctl status php7.x-fpm  
        sudo systemctl restart nginx
        php -v 

        ## PHP related to Apache is stored in /etc/php/7.4/apache2/php.ini  stop and disable Apache service.
        sudo systemctl disable --now apache2 
        sudo apt-get -y install nginx php7.4-fpm
        systemctl status php7.4-fpm nginx

        sudo nano /etc/php/7.4/fpm/pool.d/www.conf.
        ## Change the following lines by replacing the www-data with your username.
        #user = username 
        #group = username 
        #listen.owner = username
        #listen.group = username 
    
          
            
## Switch/change between Multiple PHP

        sudo update-alternatives --config php
        ## or
        sudo update-alternatives -set php /usr/bin/php7.2 

        sudo service nginx restart 
        sudo service php7.x-fpm restart
 
            
        ## Host Multiple Websites with different PHP Versions on Ubuntu 18.04 VPS 
 
        Create Website1 and Website2 

        mkdir /var/www/html/site1.example.com
        mkdir /var/www/html/site2.example.com
        #create a sample index.php file for website site1.example.com:

        nano /var/www/html/site1.example.com/index.php
        # Add the following lines:

      <?php
      phpinfo();
      ?>
     #Save and close the file. Then, create an index.php file for site2.example.com:

            nano /var/www/html/site2.example.com/index.php
        #Add the following lines:

            <?php
            phpinfo();
            ?>
        #Save and close the file. Then, change the ownership of both websites to www-data:

            chown -R www-data:www-data /var/www/html/site1.example.com
            chown -R www-data:www-data /var/www/html/site2.example.com
        #Configure Nginx
        #Next, you will need to create an Nginx virtual host file for domain site1.linuxbuz.com that uses PHP 7.0. You can do it with the following command:

            nano /etc/nginx/sites-available/site1.example.com.conf
        #Add the following lines:

                  server {
                     listen 80;
                     root /var/www/html/site1.example.com/;
                     index index.php;
                     server_name site1.example.com;
                     location / {
                        try_files $uri $uri/ =404;
                     }
                     location ~ \.php$ {
                        try_files $uri =404;
                        fastcgi_split_path_info ^(.+\.php)(/.+)$;
                        fastcgi_pass unix:/var/run/php/php7.0-fpm.sock;
                        fastcgi_index index.php;
                        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
                        include fastcgi_params;
                     }
                  }
        #Save and close the file.

Next, create an Nginx virtual host file for domain site2.example.com that uses PHP 7.2.

            nano /etc/nginx/sites-available/site2.example.com.conf
            
Add the following lines:

            server {
               listen 80;

               root /var/www/html/site2.example.com/;
               index index.php;

               server_name site2.example.com;

               location / {
                  try_files $uri $uri/ =404;
               }

               location ~ \.php$ {
                  try_files $uri =404;
                  fastcgi_split_path_info ^(.+\.php)(/.+)$;
                  fastcgi_pass unix:/var/run/php/php7.2-fpm.sock;
                  fastcgi_index index.php;
                  fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
                  include fastcgi_params;
               }
            }
Save and close the file. Then, enable both virtual host files with the following command:

            ln -s /etc/nginx/sites-available/site1.example.com.conf /etc/nginx/sites-enabled/
            ln -s /etc/nginx/sites-available/site2.example.com.conf /etc/nginx/sites-enabled/
Finally, restart Nginx and PHP-FPM service to apply all the configuration changes:

            systemctl restart nginx
            systemctl restart php7.0-fpm
            systemctl restart php7.2-fpm
Test Both Websites






Both websites are now installed and configured run with multiple versions of PHP.

Now, open your web browser and type the URL http://site1.example.com. 
You will get the following page that indicates that your Website1 is running with PHP 7.0.
Next, open your web browser and type the URL http://site2.example.com.
You will get the following page that indicates that your Website2 is running with PHP 7.2.


## Issue 1.1: composer update  show below error

    - Installation request for magento/product-community-edition 2.3.3 -> satisfiable by magento/product-community-edition[2.3.3].
    - magento/product-community-edition 2.3.3 requires ext-pdo_mysql * -> the requested PHP extension pdo_mysql is missing from your system.

   To enable extensions, verify that they are enabled in your .ini files:
   
       - /etc/php/7.2/cli/php.ini
       - /etc/php/7.2/cli/conf.d/10-opcache.ini 

Solution:

    composer update --ignore-platform-reqs
    nano /etc/php/7.2/fpm/php.ini
    
## issue php not running 

    # pass PHP scripts to FastCGI server
    #
    location ~ \.php$ {
    include snippets/fastcgi-php.conf;
    #
    # # With php-fpm (or other unix sockets):
    fastcgi_pass unix:/var/run/php/php7.2-fpm.sock;
    # # With php-cgi (or other tcp sockets):
    # fastcgi_pass 127.0.0.1:9000;
    }


# Ref

- https://www.atlantic.net/vps-hosting/host-multiple-websites-with-different-php-versions-on-ubuntu-18-04-vps/


# Play with Multi php 


## Install PHP PHP 8.2/PHP 8.1/8.0/7.3/7.2/7.1/7.0 on Ubuntu 18.04/20.4

        sudo apt update
        sudo apt upgrade
        
        sudo apt update && sudo apt -y upgrade
        
        sudo apt-get install software-properties-common
        #sudo add-apt-repository ppa:ondrej/php

        sudo add-apt-repository ppa:ppa:ondrej/nginx-mainline      
        sudo add-apt-repository ppa:ppa:ondrej/nginx
        sudo apt-get update 

        # Once the PPA is enabled, you can install PHP 8. 
        
        ##PHP 8.2 on Ubuntu 22.04|20.04|18.04        
        sudo apt -yinstall php8.2  
        sudo apt -y install php8.2-{bcmath,fpm,xml,mysql,zip,intl,ldap,gd,cli,bz2,curl,mbstring,pgsql,opcache,soap,cgi}
        sudo apt-get install -y php8.2-cli php8.2-common php8.2-fpm php8.2-mysql php8.2-zip php8.2-gd php8.2-mbstring php8.2-curl php8.2-xml php8.2-bcmath
        sudo apt -y install nginx php8.2-fpm
        sudo php-fpm8.2 -t 
        sudo service php8.2-fpm restart

        ##PHP 8.1 on Ubuntu 22.04|20.04|18.04
        sudo apt install php8.1 -y
        sudo apt install php8.1-fpm
        sudo apt install php8.1-{gd,zip,mysql,oauth,yaml,fpm,mbstring,memcache}
        sudo apt-get install -y php8.1-cli php8.1-common php8.1-mysql php8.1-zip php8.1-gd php8.1-mbstring php8.1-curl php8.1-xml php8.1-bcmath
        sudo apt-get -y install php8.1-intl


        ##8.0 on Ubuntu 22.04|20.04|18.04

        sudo apt install php8.0-mysql php8.0-gd
        sudo apt install php8.0-fpm
        sudo apt install php8.0-snmp php-memcached php8.0-mysql
        sudo apt install php8.0-common php8.0-mysql php8.0-xml php8.0-curl php8.0-gd php8.0-imagick php8.0-cli php8.0-dev php8.0-imap php8.0-mbstring php8.0-opcache php8.0-soap php8.0-zip -y
 

        ## configurations php8.1
       
        sudo sed -i "s/memory_limit = .*/memory_limit = 4768M/" /etc/php/8.1/fpm/php.ini
        sudo sed -i "s/upload_max_filesize = .*/upload_max_filesize = 128M/" /etc/php/8.1/fpm/php.ini
        sudo sed -i "s/zlib.output_compression = .*/zlib.output_compression = on/" /etc/php/8.1/fpm/php.ini
        sudo sed -i "s/session.gc_maxlifetime = .*/session.gc_maxlifetime = 180000/" /etc/php/8.1/fpm/php.ini
        sudo sed -i "s/max_input_time = .*/max_input_time = 18000/" /etc/php/8.1/fpm/php.ini
        sudo sed -i "s/max_input_vars = .*/max_input_vars = 18000/" /etc/php/8.1/fpm/php.ini
        sudo sed -i "s/max_execution_time = .*/realpath_cache_size = 8000/" /etc/php/8.1/fpm/php.ini
        sudo sed -i "s/realpath_cache_size = .*/realpath_cache_size = 8000/" /etc/php/8.1/fpm/php.ini

        ##sudo nano /etc/php/8.x/fpm/php.ini
        ; Increase realpath cache size
        realpath_cache_size = 10M
        ; Increase realpath cache ttl
        realpath_cache_ttl = 7200
        max_input_time = 1800
        upload_max_filesize = 100M
        zlib.output_compression = On
        session.gc_maxlifetime = 991440
        max_input_vars = 81000
        realpath_cache_size =8000



         

        sudo service php8.1-fpm restart      
        sudo systemctl status php8.1-fpm  
        sudo systemctl restart nginx
        php -v 
                
## Switch/change between Multiple PHP8
        #CLi
        sudo update-alternatives --config php
        ## or
        sudo update-alternatives -set php /usr/bin/php8.1 

        ##Script
        sudo nano /etc/nginx/sites-available/default

        upstream fastcgi_backend {
                server unix:/run/php/php7.2-fpm.sock;
        }

        sudo service nginx restart 
        sudo service php8.1-fpm restart
        
     ## Issue 1.1: composer update  show below error

    - Installation request for magento/product-community-edition 2.4.4 -> satisfiable by magento/product-community-edition[2.4.4].
    - magento/product-community-edition 2.4.4 requires ext-pdo_mysql * -> the requested PHP extension pdo_mysql is missing from your system.

   To enable extensions, verify that they are enabled in your .ini files:
   
       - /etc/php/8.1/cli/php.ini
       - /etc/php/8.1/cli/conf.d/10-opcache.ini 

Solution:

    composer update --ignore-platform-reqs
    nano /etc/php/8.1/fpm/php.ini





## - Install phpMyAdmin 

    sudo apt install phpmyadmin -y
    sudo apt install phpmyadmin php-mbstring php-zip php-gd php-json php-curl -y
  
 During the installation, it will ask you about the web server configuration for phpmyadmin.
 Choose none option and move the cursor to: 'OK'.
 For the phpmyadmin database configuration: choose 'Yes'
 And type new 'STRONG' phpmyadmin admin such as 'Hakaselabs001@#'.

 Enter a password: "phpmyadmin@123"
 Repeat the "phpmyadmin@123" password.


 
 #Install PhpMyAdmin
 
 
PhpMyAdmin is a PHP based application to manage MySQL or MariaDB databases from a web browser.In this step, we will install and configure phpmyadmin under the LEMP (Linux, Nginx, MySQL, and PHP-FPM) stack.Install PHPMyAdmin using the apt command below.

    sudo apt install phpmyadmin -y

During the installation, it will ask you about the web server configuration for phpmyadmin.

Choose none option and move the cursor to 'OK'.

For the phpmyadmin database configuration, choose 'Yes'.

And type new 'STRONG' phpmyadmin admin such as 'phpmyadmin'.

Repeat the 'phpmyadmin' password.


And the phpmyadmin installation is complete.

#Configure PhpMyAdmin

After the phpmyadmin installation, we need to configure phpmyadmin to run under 
the Nginx web server and configure the MySQL user phpmyadmin access.

In order to run phpmyadmin under the Nginx web server, 
we need to add the configuration to the virtual host configuration file.

Go to the '/etc/nginx' configuration directory, and edit the default virtual host file.

    cd /etc/nginx/
    vim sites-available/default     
    or
    sudo vim /etc/nginx/sites-available/default


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


## Configure MySQL User for PhpMyAdmin

In this tutorial, we will be using non-root MySQL user for phpmyadmin. We will create a new user and grant all privileges of database inside the server to the user.

Login to the MySQL shell.

    mysql -u root -p

Now create a new user using the MySQL queries below.

    create user phpmyadmin@'localhost' identified by 'PhpMyAdmin@123';
    grant all privileges on *.* to phpmyadmin@'localhost' identified by 'PhpMyAdmin@123';
    flush privileges;
    exit;

Testing
Test PHP Files
Go to the web-root directory '/var/www/html/phpinfo' and create a new phpinfo file.

    
    vim /var/www/html/info.php
    Paste the phpinfo script below.

    <?php
    phpinfo();
    ?>
    Save and exit.

Now open the web browser and type the server IP address as shown below. Replace the IP with your server ip.

    http://localhost/info.php

And below is all information about PHP server configuration.



## Remove 

    sudo apt-get remove phpmyadmin
    sudo apt-get purge phpmyadmin
    
    sudo apt-get autoremove

## issue javascript-common
E: Sub-process /usr/bin/dpkg returned an error code (1)

    sudo apt-get remove --purge javascript-common
    sudo apt autoremove


Problem phpMyAdmin - Error The mysqli extension is missing




#Ref


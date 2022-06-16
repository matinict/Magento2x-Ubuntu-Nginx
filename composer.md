

## Install  Composer

    sudo apt -y update
    sudo apt -y install php-cli unzip
    cd ~
    curl -sS https://getcomposer.org/installer -o composer-setup.php
    HASH=`curl -sS https://composer.github.io/installer.sig`
    
    composer self-update


## Remove  Composer
    sudo apt-get -y remove composer
    sudo apt-get -y remove --auto-remove composer
    sudo apt-get -y purge composer
    sudo apt-get -y purge --auto-remove composer

    where composer
    rm /usr/local/bin/composer




## Install Magento Using Composer


    ## composer create-project --repository=https://repo.magento.com/ magento/project-community-edition <install-directory-name>
    composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition=2.4.x magento2.4.x
    ##cd magento2.4.2
    
    find var generated vendor pub/static pub/media app/etc -type f -exec chmod g+w {} +
    find var generated vendor pub/static pub/media app/etc -type d -exec chmod g+ws {} +
    chown -R :www-data .
    chmod u+x bin/magento
    
    
    
    sudo find var generated vendor pub/static pub/media app/etc -type f -exec chmod g+w {} +
    sudo find var generated vendor pub/static pub/media app/etc -type d -exec chmod g+ws {} +
    sudo chown -R :www-data .
    sudo chmod u+x bin/magento 

## rollback to version 1 of composer, you simply execute:

    composer self-update --1 

    composer self-update --2 

    # specific version just by passing the version number to self-update:

    composer self-update 1.10.12
    composer self-update 2.0.7
    
    --rollback to go back to the previously installed version.

    composer self-update
    composer self-update --rollback
    composer update --ignore-platform-reqs
    
    
    composer update magento/magento-composer-installer

    composer require gene/module-braintree
    composer update gene/module-braintree 
    composer require gene/module-braintree:^4.0.0


    composer remove gene/module-braintree & composer remove paypal/module-braintree
    composer update
    composer require magento/module-braintree
    composer update
    
## Composer issue 

    rm -rf vendor/*
    composer clear-cache
    composer update
    
 ###composer update bash: /usr/bin/composer: No such file or directory run 
   
    alias composer='/usr/local/bin/composer'
    
 ###Issue: To enable extensions, verify that they are enabled in your .ini files:

        - /etc/php/8.1/cli/php.ini
        - /etc/php/8.1/cli/conf.d/10-opcache.ini 
        
        Solution:

        composer update --ignore-platform-reqs
        nano /etc/php/8.1/fpm/php.ini

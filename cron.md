## m2 cron


Cron Set Config :

    crontab -e
    

    #~ MAGENTO START a0f22a94a5abed57a5ffa0ba8d398a84026e4738e75f06430e284b7966a0786a
    * * * * * /usr/bin/php7.2 /var/www/domain/bin/magento cron:run 2>&1 | grep -v "Ran jobs by schedule" >> /var/www/domain/var/log/magento.cron.log
    * * * * * /usr/bin/php7.2 /var/www/domain/update/cron.php >> /var/www/domain/var/log/update.cron.log
    * * * * * /usr/bin/php7.2 /var/www/domain/bin/magento setup:cron:run >> /var/www/domain/var/log/setup.cron.log
    #~ MAGENTO END a0f22a94a5abed57a5ffa0ba8d398a84026e4738e75f06430e284b7966a0786a
    
    

Cron Cli List :

    php bin/magento cron:run
    crontab -l
    bin/magento cron:remove
    crontab -l

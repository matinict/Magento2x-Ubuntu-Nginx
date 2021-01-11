# m2 cron

## Create the Magento crontab

Cron Set Config :

    crontab -e
    

    #~ MAGENTO START a0f22a94a5abed57a5ffa0ba8d398a84026e4738e75f06430e284b7966a0786aa
    * * * * * /usr/bin/php7.2 /var/www/domain/bin/magento cron:run 2>&1 | grep -v "Ran jobs by schedule" >> /var/www/domain/var/log/magento.cron.log
    * * * * * /usr/bin/php7.2 /var/www/domain/update/cron.php >> /var/www/domain/var/log/update.cron.log
    * * * * * /usr/bin/php7.2 /var/www/domain/bin/magento setup:cron:run >> /var/www/domain/var/log/setup.cron.log
    #~ MAGENTO END a0f22a94a5abed57a5ffa0ba8d398a84026e4738e75f06430e284b7966a0786aa
    
    

Cron Cli List :

    php bin/magento cron:run
    crontab -l
    bin/magento cron:remove
    crontab -l
    
## Run cron from the command line

Command options:

    bin/magento cron:run [--group="<cron group name>"]
where --group specifies the cron group to run (omit this option to run cron for all groups)

To run the indexing cron job, enter:

    bin/magento cron:run --group index
To run the default cron job, enter:

    bin/magento cron:run --group default
    
## Remove the Magento crontab
You should remove the Magento crontab only before uninstalling the Magento application. To remove the Magento crontab:Log in as or switch to the Magento file system owner.Change to the Magento installation directory.Enter the following command:

    bin/magento cron:remove


## Ref

https://devdocs.magento.com/guides/v2.3/config-guide/cli/config-cli-subcommands-cron.html#create-or-remove-the-magento-crontab

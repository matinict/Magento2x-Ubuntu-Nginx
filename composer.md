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

When you want to go back to version 2 (which you should, after updating or removing the incompatible plugins):

    composer self-update --2
The above will take you to the latest on any of the two major versions.

You can also "update" to a specific version just by passing the version number to self-update:

    composer self-update 1.10.12
    composer self-update 2.0.7
And finally after performing any self-update, you can specify --rollback to go back to the previously installed version.

    composer self-update
    composer self-update --rollback
    composer update --ignore-platform-reqs
    
## Composer issue 

    rm -rf vendor/*
    composer clear-cache
    composer update

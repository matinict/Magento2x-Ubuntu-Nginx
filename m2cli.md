
# Magento 2x Command

## Frequently Needed 

    php bin/magento maintenance:enable --ip=202.74.246.84 --ip=202.74.246.84
    rm -rf var/cache/* var/tmp/_cache var/composer_home/cache/* var/view_preprocessed/* var/page_cache/* var/report/* var/log/* generated/code/*  pub/static/frontend/* pub/static/adminhtml/* pub/static/_cache/*
    php bin/magento s:up
    php bin/magento c:f
    php bin/magento setup:di:compile
    php bin/magento c:c
    php bin/magento s:s:d -f
    php -d memory_limit=2G bin/magento index:reindex
    php bin/magento c:c
    php bin/magento c:f
    php bin/magento maintenance:disable

    php bin/magento maintenance:enable --ip=202.74.246.84 --ip=10.10.16.2
    
    
    
## File Permission


    sudo find var generated vendor pub/static pub/media app/etc -type f -exec chmod g+w {} +
    sudo find var generated vendor pub/static pub/media app/etc -type d -exec chmod g+ws {} +
    sudo chown -R :www-data .
    sudo chmod u+x bin/magento

    find var generated vendor pub/static pub/media app/etc -type f -exec chmod g+w {} +
    find var generated vendor pub/static pub/media app/etc -type d -exec chmod g+ws {} +
    chown -R :www-data .
    chmod u+x bin/magento


## Maintenance Related Commands:
 
    php bin/magento maintenance:enable
    php bin/magento maintenance:enable --ip=10.10.16.1 --ip=10.10.16.2
    php bin/magento maintenance:enable --ip=none
    php bin/magento maintenance:disable
    php bin/magento maintenance:status
    php bin/magento maintenance:allow-ips --ip=192.168.0.105 --ip=103.125.97.137
 

 ## Production Mode Related CLI
 
    bin/magento deploy:mode:show  
    php bin/magento deploy:mode:set production --s 
    php -dmemory_limit=8G bin/magento setup:static-content:deploy  en_US -t Magento/backend
 
  

- Deploy on Poduction mode

```
php bin/magento setup:static-content:deploy [<languages>] [-t|--theme[="<theme>"]] [--exclude-theme[="<theme>"]] [-l|--language[="<language>"]] [--exclude-language[="<language>"]] [-a|--area[="<area>"]] [--exclude-area[="<area>"]] [-j|--jobs[="<number>"]]  [--no-javascript] [--no-css] [--no-less] [--no-images] [--no-fonts] [--no-html] [--no-misc] [--no-html-minify] [-f|--force]

php bin/magento setup:static-content:deploy --force --area frontend --theme ***/*** en_US
php bin/magento setup:static-content:deploy --theme Magento/luma --theme Magento/another_theme
php bin/magento setup:static-content:deploy -f --area frontend --theme Smartwave/porto_child en_CA



```
If enabling production mode has broken all the shop pages. Run below commands in sequence.

 ```
 php bin/magento setup:upgrade
 php bin/magento setup:static-content:deploy
 php bin/magento indexer:reindex
 ```

## Delete all cache file

```
rm -rf var/cache/* generated/code/* var/view_preprocessed/* var/page_cache/* var/report/* pub/static/frontend/* pub/static/adminhtml/* 
```


## Upgrade

```
php bin/magento setup:upgrade
php bin/magento setup:upgrade -f
```



## static-content:deploy
 
 ```
  php bin/magento setup:static-content:deploy

  php -dmemory_limit=6G bin/magento setup:static-content:deploy -t Codazon/unlimited_food_drink en_US
  php -dmemory_limit=8G bin/magento setup:static-content:deploy -f en_US -t Magento/backend
  
 ```
## Themes
 
 ```

php bin/magento setup:upgrade --keep-generated  [ If you want pub/static files while installing or updating database then use following command:]
php bin/magento setup:static-content:deploy [Static Content Deploy(use -f for force deploy on 2.2.x or later):]
php bin/magento setup:static-content:deploy en_US [Static Content Deploy For Particular Language:]
php bin/magento setup:static-content:deploy --theme="Magento/backend"  [Static Content Deploy For Magento Backend Theme Using Command Line (Working on 2.1.1 or later)]
php bin/magento setup:static-content:deploy --theme Magento/luma --theme Magento/another_theme [Static Content Deploy For Specific Themes (Working on 2.1.1 or later)]

php bin/magento setup:static-content:deploy en_US --exclude-theme Magento/luma --no-html-minify [Exclude Themes on Static Content Deploy and does not minify HTML files Using Command Line (Working on 2.1.1 or later)]
 ```
 
 
## Cache & Reindex related commands:
```
php bin/magento c:c [Cache Clean:]
php bin/magento c:f [Cache Flush: ]
php bin/magento c:status [View cache status:]
php bin/magento c:enable [cache_type Enable Cache: ]
php bin/magento c:disable [cache_type Disable Cache: ]

php  bin/magento index:reindex
php -d memory_limit=2G bin/magento index:reindex
```

## Modes related commands:
```
php bin/magento deploy:mode:show  [Check Current Mode:]
php bin/magento deploy:mode:set developer [Change To Developer Mode: ]
php bin/magento deploy:mode:set production  [Change To Production Mode: ]
```
  
  
## Module Related Commands:
```
php bin/magento module:status  [See all modules Status ]
php bin/magento module:enable Namespace_Module --clear-static-content [Enable module]
php bin/magento module:disable Namespace_Module --clear-static-content [Disable module]
php bin/magento module:uninstall Namespace_Module --clear-static-content [Uninstall Module]
```
### Db module  Related
```
SELECT * FROM `setup_module` where `module` like '%Address%'
DELETE FROM setup_module WHERE module='Namespace_Module'
DELETE FROM core_config_data WHERE path LIKE 'Namespace_Module%'
```

 
## Other Commands:

```
php bin/magento setup:di:compile [Run the single-tenant Compiler]
php bin/magento admin:user:unlock adminusername [Unlock Admin User]
php bin/magento cron:install --force [Use --force to rewrite an existing Magento crontab.]
crontab -l [view the crontab, enter the following command as the Magento file system owner. ]
php bin/magento cron:remove [Remove Magento crontab]



```
## Create Admin user  m2 terminal

 ```
 php bin/magento admin:user:create --admin-user=matin --admin-password=matin@123 --admin-email=matin@bdcrops.com --admin-firstname=Matin --admin-lastname=Rahman
 ```
## Version Upgrade

- Backup the composer.json file.

 ```
 cp composer.json composer.json.bak

 ```
 
-  Add or remove specific packages based on your needs. For example, if you are upgrading from Magento Open Source to Magento Commerce, remove the Magento Open Source package.

``
composer remove magento/product-community-edition --no-update
``

- Indicate the Magento packages, both the edition (community or enterprise) and the version (2.3.x), that you want to upgrade to.Magento Open Source:

```
composer require magento/product-community-edition=2.3.x --no-update
```
## Check Version Cli

- Admin Dashboard
- Composer.json file
- Composer.lock file
- via Command Line
- the Chrome Extension
- from the URL
- PHP Code
- Magento Version Checking tool
- Online Tools

```
php bin/magento --version
php bin/magento -V

```


## Clean m2 db
  ```
SET foreign_key_checks = 0;
TRUNCATE customer_log;
TRUNCATE customer_visitor;
TRUNCATE report_compared_product_index;
TRUNCATE report_event; 
TRUNCATE report_viewed_product_aggregated_daily;
TRUNCATE report_viewed_product_aggregated_monthly;
TRUNCATE report_viewed_product_aggregated_yearly;
TRUNCATE report_viewed_product_index;
TRUNCATE product_alert_stock; 
TRUNCATE catalogsearch_fulltext_scope1;
TRUNCATE sales_bestsellers_aggregated_yearly;
TRUNCATE sales_bestsellers_aggregated_monthly;
TRUNCATE sales_bestsellers_aggregated_daily;
SET foreign_key_checks = 1;

DELETE FROM session WHERE session_expires < UNIX_TIMESTAMP();
SELECT *, DATE_FORMAT(FROM_UNIXTIME(session_expires), '%e %b %Y %H:%i:%s') FROM session WHERE session_expires >= NOW()

  ```
 
## Cron 

 ```
 php bin/magento cron:run
 
 ```

## Change Customer Password From DB

    UPDATE `customer_entity`
    SET `password_hash` = CONCAT(SHA2('xxxxxxxxYOURPASSWORD', 256), ':xxxxxxxx:1')
    WHERE email='matinict@gmail.com'
    
    
    UPDATE `customer_entity`
    SET `password_hash` = CONCAT(SHA2('xxxxxxxxMatin@123', 256), ':xxxxxxxx:1')
    WHERE email='matinict@gmail.com'



## Merge & Minify CSS/JS


    php bin/magento config:set dev/css/merge_css_files 1
    php bin/magento config:set dev/css/minify_files 1
    php  bin/magento c:c
    
    For JS (Be carefull ):  

    php bin/magento config:set dev/js/merge_files 1
    php bin/magento config:set dev/js/minify_files 1   
    bin/magento c:f
    
    // JS Merge Only
    
    php bin/magento config:set dev/js/merge_files 1 
    bin/magento c:f

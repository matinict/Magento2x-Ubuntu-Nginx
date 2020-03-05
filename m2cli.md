
# Magento 2x Command


## Maintenance Related Commands:

```
php bin/magento maintenance:enable
php bin/magento maintenance:enable --ip=10.10.16.1 --ip=10.10.16.2
php bin/magento maintenance:enable --ip=none
php bin/magento maintenance:disable
php bin/magento maintenance:status
php bin/magento maintenance:allow-ips --ip=192.0.0.1 --ip=192.0.0.2
```


 ## Production Mode Related CLI
 
 ```
 bin/magento deploy:mode:show
 
 php bin/magento deploy:mode:set {mode} [-s|--skip-compilation]
 
 php bin/magento deploy:mode:set production --skip-compilation
 
 php -dmemory_limit=8G bin/magento setup:static-content:deploy  en_US -t Magento/backend
 
 
 
 ```

- Deploy on Poduction mode

```
php bin/magento setup:static-content:deploy [<languages>] [-t|--theme[="<theme>"]] [--exclude-theme[="<theme>"]] [-l|--language[="<language>"]] [--exclude-language[="<language>"]] [-a|--area[="<area>"]] [--exclude-area[="<area>"]] [-j|--jobs[="<number>"]]  [--no-javascript] [--no-css] [--no-less] [--no-images] [--no-fonts] [--no-html] [--no-misc] [--no-html-minify] [-f|--force]

php bin/magento setup:static-content:deploy --force --area frontend --theme ***/*** en_US
php bin/magento setup:static-content:deploy --theme Magento/luma --theme Magento/another_theme

```


## Delete all cache file

```
rm -rf var/cache/* generated/code/* var/view_preprocessed/* var/page_cache/* var/report/* pub/static/frontend/* pub/static/adminhtml/* 
```


## Upgrade

php bin/magento setup:upgrade
php bin/magento setup:upgrade -f



## static-content:deploy
 
 ```
  php bin/magento setup:static-content:deploy

  php -dmemory_limit=6G bin/magento setup:static-content:deploy -t Codazon/unlimited_food_drink en_US
  php -dmemory_limit=8G bin/magento setup:static-content:deploy -f en_US -t Magento/backend
  
 ```
 ## Reindex
 
  ```
  php  bin/magento index:reindex
  php -d memory_limit=2G bin/magento index:reindex
  ```
  
 
  
  

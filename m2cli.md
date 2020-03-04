
# Magento 2x Command

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
  
  

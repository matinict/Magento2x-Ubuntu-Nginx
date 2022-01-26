


## Install  Redis  


### Installing Redis on Ubuntu 20.04

	sudo apt update
	sudo apt install redis-server -y
	sudo systemctl status redis-server





### tftf
 
	sudo apt-get install php-redis redis-server -y
	sudo apt install redis-tools -y
	sudo nano /var/www/myMagentoSite.com/app/etc/env.php
 
```
change:
 'session' =>
  array (
    'save' => 'files',
  ),
 ```
with:
```
'session' => 
   array (
   'save' => 'redis',
   'redis' => 
      array (
	'host' => '127.0.0.1',
	'port' => '6379',
	'password' => '',
	'timeout' => '2.5',
	'persistent_identifier' => '',
	'database' => '0',
	'compression_threshold' => '2048',
	'compression_library' => 'gzip',
	'log_level' => '1',
	'max_concurrency' => '6',
	'break_after_frontend' => '5',
	'break_after_adminhtml' => '30',
	'first_lifetime' => '600',
	'bot_first_lifetime' => '60',
	'bot_lifetime' => '7200',
	'disable_locking' => '0',
	'min_lifetime' => '60',
	'max_lifetime' => '2592000'
    )
),
```
and to use Redis for page caching add:
```
'cache' =>
array(
   'frontend' =>
   array(
      'default' =>
      array(
         'backend' => 'Cm_Cache_Backend_Redis',
         'backend_options' =>
         array(
            'server' => '127.0.0.1',
            'port' => '6379'
            ),
    ),
    'page_cache' =>
    array(
      'backend' => 'Cm_Cache_Backend_Redis',
      'backend_options' =>
       array(
         'server' => '127.0.0.1',
         'port' => '6379',
         'database' => '1',
         'compress_data' => '0'
       )
    )
  )
),
``` 


 
    php bin/magento c:f
    
 ## Check if Redis cache is working
 
To verify that Redis and Magento are working together, use the following commands:

	##Redis ping : 
	redis-cli ping 

	##Redis monitor: 
	redis-cli monitor
 
 
 ### Ref
 
 https://linuxize.com/post/how-to-install-and-configure-redis-on-ubuntu-20-04/
 
 https://www.mageplaza.com/devdocs/redis-cache-magento-2.html

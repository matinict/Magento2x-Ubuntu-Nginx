


## Install and configure Redis caching 
 
	sudo apt-get install php-redis redis-server
	sudo apt install redis-tools 
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
 

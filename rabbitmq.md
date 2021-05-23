
## Install RabbitMQ on Ubuntu

     sudo apt install -y rabbitmq-server
     
     --amqp-host="<hostname>" --amqp-port="5672" --amqp-user="<user_name>" --amqp-password="<password>" --amqp-virtualhost="/"
     
     ## <install_directory>/app/etc/env.php
     
     'queue' =>
        array (
          'amqp' =>
          array (
            'host' => 'rabbitmq.example.com',
            'port' => '11213',
            'user' => 'magento',
            'password' => 'magento',
            'virtualhost' => '/'
           ),
        ),
        
         bin/magento setup:upgrade 
         
         ## SSL, edit the ssl and ssl_options parameters in the <install_directory>/app/etc/env.php
         
         'queue' =>
              array (
                'amqp' =>
                array (
                  'host' => 'rabbitmq.example.com',
                  'port' => '11213',
                  'user' => 'magento',
                  'password' => 'magento',
                  'virtualhost' => '/',
                  'ssl' => 'true',
                  'ssl_options' => [
                        'cafile' =>  '/etc/pki/tls/certs/DigiCertCA.crt',
                        'certfile' => '/path/to/magento/app/etc/ssl/test-rabbit.crt',
                        'keyfile' => '/path/to/magento/app/etc/ssl/test-rabbit.key'
                   ],
                 ),
              ),

        ## 
        


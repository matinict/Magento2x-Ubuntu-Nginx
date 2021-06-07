# Integration with Magento 2.4x

Once the RabbitMQ server is up and ready to accept client connections, developers need to configure Magento to be able to communicate with RabbitMQ.
Either provide the below-listed RabbitMQ associated environment variables via the command-line or append them to the env.php file:

     Host
     Port
     User
     Password
     Virtualhost
     Cafile
     Certfile
     Keyfile
     
     # configure message queues in RabbitMQ involves creating and modifying the following configuration files.
     communication.xml – defines aspects of the message queue system that all communication types have in common
     queue_consumer.xml – defines the relationship between an existing queue and its consumer
     queue_topology.xml – defines the message routing rules and declares queues and exchanges
     queue_publisher.xml – defines the exchange where a topic is published
     
     
     # only need to create and configure communication.xml and one or two of these files want to publish to an existing queue created by a third-party system queue_publisher.xml .
     # If we only want to consume from an existing queue,need the queue_consumer.xml config file. In cases where we want to configure the local queue and publish it for third-party systems to consume, we will need the queue_publisher.xml and queue_topology.xml files.When we want to configure the local queue and consume messages published by third-party system, we will need the queue_topology.xml and queue_consumer.xml files.Complete these steps once the configuration is complete:

      ##  to install custom module in Magento
      php bin/magento setup:upgrade
      
      ## ” and verify consumer-defined in queue_consumer.xml is listed in the output
      php bin/magento queue:consumers:list
      
      ##” to run the consumer
      php bin/magento queue:consumers:start ConsumerName




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
        


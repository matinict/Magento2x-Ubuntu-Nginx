# Elasticsearch On Magento 2.3x


## 1.1a Install the JDK on Ubuntu
      
      java -version 
      sudo apt -y install default-jre
      sudo apt -y install openjdk-11-jre-headless
      sudo apt -y install openjdk-8-jre-headless

To install JDK 1.8 on Ubuntu, enter the following commands as a user with root privileges:

      sudo add-apt-repository -y ppa:webupd8team/java
      sudo apt-get -y update
      sudo apt-get install -y oracle-java8-installer


## 1.1b  Install the JDK 1.8 on Ubuntu

      sudo apt-get -y update
      sudo apt-get install -y openjdk-8-jdk
       



## 1.2a Install Elasticsearch 7.x

      wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
      sudo apt-get install apt-transport-https
      echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-7.x.list
      sudo apt-get update && sudo apt-get install elasticsearch
      
      OR,
      wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.11.1-amd64.deb
      wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.11.1-amd64.deb.sha512
      shasum -a 512 -c elasticsearch-7.11.1-amd64.deb.sha512 
      sudo dpkg -i elasticsearch-7.11.1-amd64.deb


 

## 1.3 Start & Check Status Elasticsearch:

-Running with Service:

      sudo service elasticsearch start
      sudo service elasticsearch status
      
- Running with Systemd: To configure Elasticsearch to start automatically when the system boots up, run the following commands:

      sudo /bin/systemctl daemon-reload
      sudo /bin/systemctl enable elasticsearch.service
      sudo systemctl start elasticsearch.service
      sudo systemctl stop elasticsearch.service
      
      sudo journalctl -f
      sudo journalctl --unit elasticsearch

## 1.4  — Configuring Elasticsearch
To configure Elasticsearch, we will edit its main configuration file elasticsearch.yml where most of its configuration options are stored. This file is located in the /etc/elasticsearch directory. Use your preferred text editor to edit Elasticsearch’s configuration file. Here, we’ll use nano:

      sudo nano /etc/elasticsearch/elasticsearch.yml

            . . .
      # ---------------------------------- Network -----------------------------------
      #
      # Set the bind address to a specific IP (IPv4 or IPv6):
      #
      network.host: localhost
      
      
      sudo systemctl start elasticsearch
      sudo systemctl enable elasticsearch
      
      curl -X GET 'http://localhost:9200'






## 1.5 Verify  Elasticsearch
 Elasticsearch is working by entering the following command on the server on which it is running:
 

      curl -XGET '<host>:9200/_cat/health?v&pretty'
      
      curl -XGET 'localhost:9200/_cat/health?v&pretty'

A message similar to the following is displayed:

```
epoch      timestamp cluster       status node.total node.data shards pri relo init unassign pending_tasks
1519701563 03:19:23  elasticsearch green           1         1      0   0    0    0        0             0

```

            # Check version
            
            curl http://localhost:9200
            
## 1.8 Magento admin setting 
      
      Go to STORES > CONFIGURATION > CATALOG > CATALOG > CATALOG SEARCH > Elasticsearch Index Prefix.
      
      # Set a different prefix for each store, any random one for each. Reindex and flush cache on each store.

       php -d memory_limit=2G bin/magento index:reindex

            

## 1.7 Removing ElasticSearch from @Magento 2.4" [Yireo_RemoveSearch](https://github.com/yireo/Yireo_RemoveSearch)
 
        
        php bin/magento module:disable Magento_AdvancedSearch Magento_CatalogSearch Magento_Elasticsearch Magento_Elasticsearch Magento_Elasticsearch-6  Magento_Elasticsearch-7 Magento_InventoryCatalogCearch   Magento_Inventory-Elasticsearch Magento_Search  Elasticsearch_Elasticsearch
        
        


## Problem

#### Job for elasticsearch.service failed because the control process exited with error code.See "systemctl status elasticsearch.service" and "journalctl -xe" for details.


## 1.5 Remove/Uninstall Elasticsearch


### exception(s): Exception #0 (Elasticsearch\Common\Exceptions\BadMethodCallException): Namespace [suggest] not found


# Ref:

- [devdocs](https://devdocs.magento.com/guides/v2.3/config-guide/elasticsearch/es-overview.html)
- [elastic](https://www.elastic.co/guide/en/elasticsearch/reference/current/deb.html)
- [es-config-nginx](https://devdocs.magento.com/guides/v2.3/config-guide/elasticsearch/es-config-nginx.html)
- [es-config-apache](https://devdocs.magento.com/guides/v2.3/config-guide/elasticsearch/es-config-apache.html)
- [es-configure-magento](https://devdocs.magento.com/guides/v2.3/config-guide/elasticsearch/configure-magento.html)
- [tigren](https://www.tigren.com/magento-2-elasticsearch/)
- [Max Pronko](https://youtu.be/ES3XIzWiffo)
- [Magento-2-Elasticsearch-important](https://www.quora.com/What-is-Magento-2-Elasticsearch-Is-it-really-important)




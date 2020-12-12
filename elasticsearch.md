# Elasticsearch On Magento 2.3x


## 1.1a Install the JDK on Ubuntu
      
      java -version
      
      Output
      Command 'java' not found, but can be installed with:

      apt install default-jre
      apt install openjdk-11-jre-headless
      apt install openjdk-8-jre-headless



To install JDK 1.8 on Ubuntu, enter the following commands as a user with root privileges:
```
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get -y update
sudo apt-get install -y oracle-java8-installer
```

## 1.1b  Install the JDK 1.8 on Ubuntu

      sudo apt-get -y update
      sudo apt-get install -y openjdk-8-jdk
       



## 1.2a Install Elasticsearch 7.x

      wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
      sudo apt-get install apt-transport-https
      echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-7.x.list
      sudo apt-get update && sudo apt-get install elasticsearch


## 1.2b Install Elasticsearch 6.x
- Log in to your Magento server as a user with root privileges.

- Ubuntu: Install Elasticsearch 6.x using the Elasticsearch Ubuntu documentation

      wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
      sudo apt-get install apt-transport-https
      echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list

      sudo apt install elasticsearch


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

## Problem

#### Job for elasticsearch.service failed because the control process exited with error code.See "systemctl status elasticsearch.service" and "journalctl -xe" for details.


## 1.5 Remove/Uninstall Elasticsearch




# Ref:

- [devdocs](https://devdocs.magento.com/guides/v2.3/config-guide/elasticsearch/es-overview.html)
- [elastic](https://www.elastic.co/guide/en/elasticsearch/reference/current/deb.html)
- [es-config-nginx](https://devdocs.magento.com/guides/v2.3/config-guide/elasticsearch/es-config-nginx.html)
- [es-config-apache](https://devdocs.magento.com/guides/v2.3/config-guide/elasticsearch/es-config-apache.html)
- [es-configure-magento](https://devdocs.magento.com/guides/v2.3/config-guide/elasticsearch/configure-magento.html)
- [tigren](https://www.tigren.com/magento-2-elasticsearch/)
- [Max Pronko](https://youtu.be/ES3XIzWiffo)
- [Magento-2-Elasticsearch-important](https://www.quora.com/What-is-Magento-2-Elasticsearch-Is-it-really-important)




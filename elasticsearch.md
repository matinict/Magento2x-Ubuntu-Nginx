# Elasticsearch On Magento 2.3x


## Install the JDK on Ubuntu
To install JDK 1.8 on Ubuntu, enter the following commands as a user with root privileges:
```
add-apt-repository -y ppa:webupd8team/java
apt-get -y update
apt-get install -y oracle-java8-installer
```


## Install Elasticsearch 6.x
- Log in to your Magento server as a user with root privileges.

- Ubuntu: Install Elasticsearch 6.x using the Elasticsearch Ubuntu documentation

```
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list


```


## Start & Check Status Elasticsearch:

      sudo service elasticsearch start
      sudo service elasticsearch status


Verify that Elasticsearch is working by entering the following command on the server on which it is running:
```
curl -XGET '<host>:9200/_cat/health?v&pretty'
```
A message similar to the following is displayed:

```
epoch      timestamp cluster       status node.total node.data shards pri relo init unassign pending_tasks
1519701563 03:19:23  elasticsearch green           1         1      0   0    0    0        0             0

```

Ref:

    - [devdocs](https://devdocs.magento.com/guides/v2.3/config-guide/elasticsearch/es-overview.html)
    - [elastic](https://www.elastic.co/guide/en/elasticsearch/reference/current/deb.html)
    - [es-config-nginx](https://devdocs.magento.com/guides/v2.3/config-guide/elasticsearch/es-config-nginx.html)
    - [es-config-apache](https://devdocs.magento.com/guides/v2.3/config-guide/elasticsearch/es-config-apache.html)
    - [es-configure-magento](https://devdocs.magento.com/guides/v2.3/config-guide/elasticsearch/configure-magento.html)
    - [tigren](https://www.tigren.com/magento-2-elasticsearch/)
    - [Max Pronko](https://youtu.be/ES3XIzWiffo)
    - [Magento-2-Elasticsearch-important](https://www.quora.com/What-is-Magento-2-Elasticsearch-Is-it-really-important)




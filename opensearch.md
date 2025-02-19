#opensearch
The OpenSearch service is an open-source fork of Elasticsearch 7.10.2, following the licensing changes for Elasticsearch. See the OpenSource Project in GitHub.


WARNING
Elasticsearch 7.11 and later is not supported for Adobe Commerce on cloud infrastructure. Adobe Commerce versions 2.3.7-p3, 2.4.3-p2, and 2.4.4 and later support the OpenSearch service. The on-premises installations continue to support Elasticsearch.

##Install and Configure OpenSearch
    
    curl -fsSL https://artifacts.opensearch.org/publickeys/opensearch.pgp| gpg --dearmor -o /etc/apt/trusted.gpg.d/opensearch.gpg
    echo "deb https://artifacts.opensearch.org/releases/bundle/opensearch/2.x/apt stable main" | tee /etc/apt/sources.list.d/opensearch-2.x.list
    sudo apt update -y
    #env OPENSEARCH_INITIAL_ADMIN_PASSWORD=Your1982_Something@Secure apt install opensearch
     env matin@321=matin1@gmail.com  sudo apt install opensearch -y
    
    sudo nano /etc/opensearch/opensearch.yml
    ##Change the default values as per your requirements:
    cluster.name: ocluster1
    network.host: 0.0.0.0
    http.port: 9200
    discovery.type: single-node
    node.name: ${HOSTNAME}
    plugins.security.disabled: false
    plugins.security.ssl.http.enabled: false
    
    sudo systemctl daemon-reload
    sudo systemctl restart opensearch
    sudosystemctl status opensearch

#Install OpenSearch Dashboard

    echo "deb https://artifacts.opensearch.org/releases/bundle/opensearch-dashboards/2.x/apt stable main" | tee -a /etc/apt/sources.list.d/opensearch-2.x.list
    apt update
    apt install opensearch-dashboards
    nano /etc/opensearch-dashboards/opensearch_dashboards.yml
    ##Change the following settings:
    server.host: "0.0.0.0"
    server.ssl.enabled: false
    opensearch.hosts: ["http://localhost:9200"]
    
    systemctl restart opensearch-dashboards
    systemctl status opensearch-dashboards
    http://your-server-ip:5601.




## Ref
https://medium.com/@doriankno/setting-up-and-testing-opensearch-on-ubuntu-22-04-5fb481786466
https://www.atlantic.net/dedicated-server-hosting/how-to-install-opensearch-on-ubuntu-22-04/
https://experienceleague.adobe.com/en/docs/commerce-on-cloud/user-guide/configure/service/opensearch

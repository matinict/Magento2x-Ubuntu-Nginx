## Remove apache2

    sudo service apache2 stop
    sudo systemctl disable --now apache2
    sudo apt-get purge apache2 apache2-utils apache2.2-bin apache2-common
    sudo apt-get autoremove 
    whereis apache2
      
    sudo rm -rf /etc/apache2


## Restart
```
sudo systemctl restart httpd.service
sudo apachectl –k restart
apachectl –k stop
apachectl –k graceful
apachectl –k restart
apachectl –k graceful–stop
sudo systemctl start httpd.service
sudo systemctl stop httpd.service
sudo systemctl reload httpd.service
```



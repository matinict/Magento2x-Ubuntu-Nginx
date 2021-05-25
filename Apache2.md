## Status apache2

    httpd -v
    sudo systemctl status apache2
    sudo systemctl is-enabled apache2
    
    ## Chk permission user/group 
    ps aux | egrep '(apache|httpd)'
    
 ## Chk issue log
 
    apachectl -S
    # Main ErrorLog: "/etc/apache2/logs/error_log"
    cat /etc/apache2/logs/error_log
    
    truncate -s 0 /etc/apache2/logs/error_log




## Remove apache2

    sudo service apache2 stop
    sudo systemctl disable --now apache2
    sudo apt-get purge apache2 apache2-utils apache2.2-bin apache2-common
    sudo apt-get autoremove 
    whereis apache2
      
    sudo rm -rf /etc/apache2


## Restart

    sudo systemctl restart httpd.service
    sudo apachectl –k restart
    apachectl –k stop
    apachectl –k graceful
    apachectl –k restart
    apachectl –k graceful–stop
    sudo systemctl start httpd.service
    sudo systemctl stop httpd.service
    sudo systemctl reload httpd.service



## LAMP (Linux, Apache, MySQL, PHP)

Step 1 — Installing Apache and Updating the Firewall The Apache web server is among the most popular web servers in the world. It’s well documented, has an active community of users, and has been in wide use for much of the history of the web, which makes it a great default choice for hosting a website.Install Apache using Ubuntu’s package manager, apt:

    sudo apt update
    sudo apt install apache2
 
If this is the first time you’re using sudo within this session, you’ll be prompted to provide your user’s password to confirm you have the right privileges to manage system packages with apt. You’ll also be prompted to confirm Apache’s installation by pressing Y, then ENTER.Once the installation is finished, you’ll need to adjust your firewall settings to allow HTTP traffic. UFW has different application profiles that you can leverage for accomplishing that. To list all currently available UFW application profiles, you can run:

    sudo ufw app list 

    Output
    Available applications:
      Apache
      Apache Full
      Apache Secure
      
      OpenSSH
Here’s what each of these profiles mean:
Apache: This profile opens only port 80 (normal, unencrypted web traffic).
Apache Full: This profile opens both port 80 (normal, unencrypted web traffic) and port 443 (TLS/SSL encrypted traffic).
Apache Secure: This profile opens only port 443 (TLS/SSL encrypted traffic).For now, it’s best to allow only connections on port 80, since this is a fresh Apache installation and you still don’t have a TLS/SSL certificate configured to allow for HTTPS traffic on your server. To only allow traffic on port 80, use the Apache profile:

    sudo ufw allow in "Apache" 
    sudo ufw status
 
Output
Status: active

    To                         Action      From
    --                         ------      ----
    OpenSSH                    ALLOW       Anywhere                                
    Apache                     ALLOW       Anywhere                  
    OpenSSH (v6)               ALLOW       Anywhere (v6)                    
    Apache (v6)                ALLOW       Anywhere (v6)     
    
    #if inactive 
    
    sudo ufw enable


 
http://your_server_ip 





## Troubleshot /Apache Log Files


    sudo tail -n 10 /var/log/apache2/error.log
    
    # on CentOS/RHEL-based distributions:     
    sudo tail -n 10 /var/log/httpd/error_log

    # on Debian/Ubuntu-based distributions: 
    sudo tail -n 10 /var/log/apache2/error.log







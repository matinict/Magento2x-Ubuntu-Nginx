

 # Install the softwares: 
 
      $ sudo apt-get update
      $ sudo apt-get -y install git wget curl nano unzip sudo vim net-tools openssh-server
      - Install the Nginx 1.10.x: 
      $ sudo apt-get -y install nginx
      $ sudo service nginx start
      nginx -v
      
      Firewall setup:
      To make our server being able to serve pages to other machines 
      we must setup the firewall to allow incoming traffic through port 80 (the default), and port 443 
      if we want to use the https protocol. The exact command to run to accomplish that, 
      depends on the firewall manager in use on the machine, but here I will assume the ufw is running, 
      since it is the default on Ubuntu.
      
      First, we verify that the firewall is active:
      $ sudo ufw status
      If it's not you can activate it by executing the following linux command:
      $ sudo ufw enable
      However be careful when, because as the system will notify you, activating the firewall could destroy currently existing connections. To allow incoming connections via port 80, we should run:
      $ sudo ufw allow 80/tcp
      To allow port 443, instead:
      $ sudo ufw allow 443/tcp
      Finally, to visualize the current status of the firewall, we can run:
      $ sudo ufw status numbered
      Status: active

           To                         Action      From
           --                         ------      ----
      [ 1] 443/tcp                    ALLOW IN    Anywhere
      [ 2] 80/tcp                     ALLOW IN    Anywhere
      [ 3] 443/tcp (v6)               ALLOW IN    Anywhere (v6)
      [ 4] 80/tcp (v6)                ALLOW IN    Anywhere (v6)
      
# Permission 


    sudo mkdir /var/www/html/mysite
    sudo chown $USER:www-data /var/www/html/mysite
    sudo chmod g+s /var/www/html/mysite
    sudo chmod o-rwx /var/www/html/mysite
    
    
##  How to see a list of www-data members

    grep ^www-data /etc/group

Sample outputs: www-data:x:33:

## How do I add an existing user named matin to group Apache group www-data?
Simply run the following command to add an existing user to an existing group:

       sudo adduser {USER-NAME-HERE} {GROUP-NAME-HERE}
       sudo adduser matin www-data
         
 ## Add a new user to the www-data group
In this example, add a new user called matin to the www-data group, enter:

    sudo useradd -g www-data matin
 
### set the password for matin user ###
    sudo passwd matin

## Troubleshooting Nginx

### [emerg]: bind() to 0.0.0.0:80 failed (98: Address already in use)
If you get following error, when you try to start nginx…[emerg]: bind() to 0.0.0.0:80 failed (98: Address already in use)
Then it means nginx or some other process is already using port 80. You can kill it using:And then try restarting nginx again
 ```
 sudo fuser -k 80/tcp 
 sudo fuser -k 443/tcp
 sudo service nginx start
 
 or
 
 nginx -t -c /etc/nginx/nginx.conf
 
 ps -eaf |grep nginx
 
 sudo cat /var/log/nginx/error.log|less
 
 //ps -eaf |grep nginx and netstat -tulpn |grep 80 a
 //kill -9 749 
 grep -r 'listen ' /etc/nginx/*
 
 ``` 

### nginx: [warn] could not build optimal proxy_headers_hash, you should increase either proxy_headers_hash_max_size: 512 or proxy_headers_hash_bucket_size: 64; ignoring proxy_headers_hash_bucket_size



 

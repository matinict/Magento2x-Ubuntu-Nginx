# MariaDB

## Ubuntu 22.04/24.04

      sudo apt update
      sudo apt install mariadb-server
      sudo mysql_secure_installation
      sudo systemctl start mariadb.service
      sudo mariadb
      CREATE USER 'matin'@'localhost' IDENTIFIED BY 'matin@123';
      CREATE USER 'matin'@'127.0.0.1' IDENTIFIED BY 'matin@123';
      CREATE USER 'matin'@'*' IDENTIFIED BY 'matin@123';
      
      GRANT ALL PRIVILEGES ON * . * TO 'matin'@'localhost';
      GRANT ALL PRIVILEGES ON * . * TO 'matin'@'127.0.0.1';
      GRANT ALL PRIVILEGES ON * . * TO 'matin'@'*'; 
      FLUSH PRIVILEGES;
      
      GRANT ALL ON *.* TO 'admin'@'localhost' IDENTIFIED BY 'password' WITH GRANT OPTION;
      GRANT ALL ON *.* TO 'matin'@'localhost' IDENTIFIED BY 'matin@123' WITH GRANT OPTION;
      GRANT ALL ON *.* TO 'matin'@'localhost' IDENTIFIED BY 'matin@123' WITH GRANT OPTION;
      FLUSH PRIVILEGES;
      exit
      sudo systemctl status mariadb  

      ##PHPMYADMIN
      sudo apt -y install phpmyadmin  -y
      sudo mysqladmin version
      mysqladmin -u admin -p version


## CentOS
### Install the MariaDB package using the yum package manager:

      sudo yum install mariadb-server -y
      #Press y when prompted to proceed with the installation.

      #Once the installation is complete
      sudo systemctl start mariadb
      sudo systemctl enable mariadb

      #To verify  
      sudo systemctl status mariadb

      #The output should show that the service is active and running:

      #Run the mysql_secure_installation script which will perform several security related tasks:

      sudo mysql_secure_installation

      #prompted to set up the root user password, remove anonymous user accounts, restrict root user access to the local machine, and remove the test database.

      #steps are explained in detail. It is recommended to answer Y (yes) to all questions.
      
      
      or 
      
      
      
      nano /etc/yum.repos.d/MariaDB.repo
      
      # MariaDB 10.3 CentOS repository list - created 2018-05-25 19:02 UTC
      # http://downloads.mariadb.org/mariadb/repositories/
      [mariadb]
      name = MariaDB
      baseurl = http://yum.mariadb.org/10.3/centos7-amd64
      gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
      gpgcheck=1


      sudo yum install MariaDB-server MariaDB-client -y



      mariadb --version


### MariaDB Upgrade from 10.1 to 10.2


      #Verify if MariaDB 10.1 is installed

      rpm -qa|grep -i maria|grep "\-10.1."
      #Upgrade

      service mysql stop
      service mariadb stop
      systemctl disable mariadb
      rpm --nodeps -ev MariaDB-server
      yum -y install MariaDB-server
      yum -y update "MariaDB-*"
      systemctl enable mariadb
      service mariadb start
      mysql_upgrade
      #Check for the custom configuration

      diff -Bw /etc/my.cnf.d/server.cnf.rpmsave /etc/my.cnf.d/server.cnf
      #Verify upgraded packages

      rpm -qa|grep -i maria|grep "\-10.2."
      #The output should look like this

      #MariaDB-compat-10.2.36-1.el7.centos.x86_64
      #MariaDB-server-10.2.36-1.el7.centos.x86_64
      #MariaDB-common-10.2.36-1.el7.centos.x86_64
      #MariaDB-shared-10.2.36-1.el7.centos.x86_64
      #MariaDB-client-10.2.36-1.el7.centos.x86_64



### MariaDB Upgrade from 10.2 to 10.4

      #Verify if MariaDB 10.2 is installed

      rpm -qa|grep -i maria|grep "\-10.2."
      #First you need to change the MariaDB repo and replace it with MariaDB 10.4 repo:

      sed -i 's/10.2/10.4/g' /etc/yum.repos.d/mariadb.repo

      #Second remove MariaDB 10.2 :

      systemctl stop mariadb mysql mysqld
      systemctl disable mariadb
      rpm --nodeps -ev MariaDB-server


      #Third Install MariaDB 10.4 :
      yum clean all
      yum -y update "MariaDB-*"
      yum -y install MariaDB-server
      systemctl enable mariadb
      systemctl start mariadb
      Fourth you need to upgrade your database tables to the latest version:

      mysql_upgrade --force
      After upgrade, you can use "mysql" command to verify the MariaDB version running on your server

      mysql --version



http://127.0.0.1/phpmyadmin


## Problem


P: Current version of RDBMS is not supported. Used Version: 10.11.8-MariaDB-0ubuntu0.24.04.1. Supported versions: MySQL-8, M  
  ySQL-5.7, MariaDB-(10.2-10.6)   

  sudo apt-get remove mariadb-server -y
  sudo apt-get install mariadb-server-10.6 -y


  

### Ref
https://linuxize.com/post/install-mariadb-on-centos-7/

https://wiki.centos-webpanel.com/mariadb-upgrade-from-10-2-to-10-4

https://wiki.centos-webpanel.com/mariadb-upgrade-from-10-1-to-10-2

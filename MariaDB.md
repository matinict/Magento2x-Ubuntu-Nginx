# MariaDB


### Install the MariaDB package using the yum package manager:

      sudo yum install mariadb-server -y

      #Press y when prompted to proceed with the installation.

      #Once the installation is complete, start the MariaDB service and enable it to start on boot using the following commands:

      sudo systemctl start mariadb
      sudo systemctl enable mariadb

      #To verify that the installation was successful, check the MariaDB service status by typing:

      sudo systemctl status mariadb

      #The output should show that the service is active and running:

      #Run the mysql_secure_installation script which will perform several security related tasks:

      sudo mysql_secure_installation

      #You will be prompted to set up the root user password, remove anonymous user accounts, restrict root user access to the local machine, and remove the test database.

      #steps are explained in detail. It is recommended to answer Y (yes) to all questions.



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


### Ref

https://wiki.centos-webpanel.com/mariadb-upgrade-from-10-2-to-10-4
https://wiki.centos-webpanel.com/mariadb-upgrade-from-10-1-to-10-2

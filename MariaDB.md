
## MariaDB Upgrade from 10.2 to 10.4

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

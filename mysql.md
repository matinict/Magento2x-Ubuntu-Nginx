

## MariaDB
      sudo apt update
      sudo apt install mariadb-server -y
      sudo mysql_secure_installation 

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
      sudo mysqladmin version



## MySQL  



### Step 1 –Install it on Ubuntu 20.04 LTS:

      sudo apt search mysql-server
      sudo apt info mysql-server
      
      sudo apt install mysql-server -y
 
### Step 2 – Securing MySQL server

      sudo mysql
      ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'matin@123';

      sudo mysql_secure_installation
 
      ```
      Securing the MySQL server deployment. Connecting to MySQL using a blank password.

      VALIDATE PASSWORD COMPONENT can be used to test passwords
      and improve security. It checks the strength of password
      and allows the users to set only those passwords which are
      secure enough. Would you like to setup VALIDATE PASSWORD component?

      Press y|Y for Yes, any other key for No: n
      Please set the password for root here.

      New password: 

      Re-enter new password: 
      By default, a MySQL installation has an anonymous user,
      allowing anyone to log into MySQL without having to have
      a user account created for them. This is intended only for
      testing, and to make the installation go a bit smoother.
      You should remove them before moving into a production
      environment.

      Remove anonymous users? (Press y|Y for Yes, any other key for No) : no

       ... skipping.


      Normally, root should only be allowed to connect from
      'localhost'. This ensures that someone cannot guess at
      the root password from the network.

      Disallow root login remotely? (Press y|Y for Yes, any other key for No) : no

       ... skipping.
      By default, MySQL comes with a database named 'test' that
      anyone can access. This is also intended only for testing,
      and should be removed before moving into a production
      environment.


      Remove test database and access to it? (Press y|Y for Yes, any other key for No) : y
       - Dropping test database...
      Success.

       - Removing privileges on test database...
      Success.

      Reloading the privilege tables will ensure that all changes
      made so far will take effect immediately.

      Reload privilege tables now? (Press y|Y for Yes, any other key for No) : y
      Success.

      All done! 

      ```

There are three levels of password validation policy:
```
LOW    Length >= 8
MEDIUM Length >= 8, numeric, mixed case, and special characters
STRONG Length >= 8, numeric, mixed case, special characters and dictionary                  file
Please enter 0 = LOW, 1 = MEDIUM and 2 = STRONG: 1
Next, you’ll be asked to submit and confirm a root password:
Please set the password for root here.
New password:
Re-enter new password:
```

For the rest of the questions, you should press Y and hit the ENTER key at each prompt. This will remove some anonymous users and the test database, disable remote root logins, and load these new rules so that MySQL immediately respects the changes we have made.

Note that in Ubuntu systems running MySQL 5.7 (and later versions), the root MySQL user is set to authenticate using the auth_socket plugin by default rather than with a password. This allows for some greater security and usability in many cases, but it can also complicate things when you need to allow an external program (e.g., phpMyAdmin) to access the user.

### Step 3 – Enabling MySQL server at boot time  server start when Ubuntu 20.04 LTS boots:

      sudo systemctl is-enabled mysql.service
      sudo systemctl enable mysql.service
      sudo systemctl status mysql.service

      ● mysql.service - MySQL Community Server
           Loaded: loaded (/lib/systemd/system/mysql.service; enabled; vendor preset: enabled)
           Active: active (running) since Fri 2020-10-23 09:20:17 UTC; 16min ago
         Main PID: 1129 (mysqld)
           Status: "Server is operational"
            Tasks: 40 (limit: 4680)
           Memory: 338.6M
           CGroup: /system.slice/mysql.service
                   └─1129 /usr/sbin/mysqld 
             
### Step 4 – Starting/Stopping/Restarting MySQL server 

      sudo systemctl start mysql.service 
      sudo systemctl stop mysql.service 
      sudo systemctl restart mysql.service 
      sudo journalctl -u mysql.service -xe
      sudo tail -f /var/log/mysql/error.log
      

### Truoble in PhpMyAdmin Login

- Issue: mysqli_real_connect(): The server requested authentication method unknown to the client [caching_sha2_password]
 

      sudo mysql 
      SELECT user,authentication_string,plugin,host FROM mysql.user;
   
``` 
Output
+------------------+-------------------------------------------+-----------------------+-----------+
| user             | authentication_string                     | plugin                | host      |
+------------------+-------------------------------------------+-----------------------+-----------+
| root             |                                           | auth_socket           | localhost |
| mysql.session    | *THISISNOTAVALIDPASSWORDTHATCANBEUSEDHERE | mysql_native_password | localhost |
| mysql.sys        | *THISISNOTAVALIDPASSWORDTHATCANBEUSEDHERE | mysql_native_password | localhost |
| debian-sys-maint | *CC744277A401A7D25BE1CA89AFF17BF607F876FF | mysql_native_password | localhost |
+------------------+-------------------------------------------+-----------------------+-----------+
4 rows in set (0.00 sec)
```
In this example, you can see that the root user does in fact authenticate using the auth_socket plugin. To configure the root account to authenticate with a password, run the following ALTER USER command. Be sure to change password to a strong password of your choosing:

      ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'matin@123';
      FLUSH PRIVILEGES;
 
Check the authentication methods employed by each of your users again to confirm that root no longer authenticates using the auth_socket plugin:

      SELECT user,authentication_string,plugin,host FROM mysql.user;
  
      Output:
      +------------------+-------------------------------------------+-----------------------+-----------+
      | user             | authentication_string                     | plugin                | host      |
      +------------------+-------------------------------------------+-----------------------+-----------+
      | root             | *3636DACC8616D997782ADD0839F92C1571D6D78F | mysql_native_password | localhost |
      | mysql.session    | *THISISNOTAVALIDPASSWORDTHATCANBEUSEDHERE | mysql_native_password | localhost |
      | mysql.sys        | *THISISNOTAVALIDPASSWORDTHATCANBEUSEDHERE | mysql_native_password | localhost |
      | debian-sys-maint | *CC744277A401A7D25BE1CA89AFF17BF607F876FF | mysql_native_password | localhost |
      +------------------+-------------------------------------------+-----------------------+-----------+
      4 rows in set (0.00 sec) 

      mysql -u root -p
  

### How to Create a New User 

         # sudo mysql -u root -p
         CREATE USER 'matin'@'localhost' IDENTIFIED BY 'matin@123';
         CREATE USER 'matin'@'127.0.0.1' IDENTIFIED BY 'matin@123';
         CREATE USER 'matin'@'*' IDENTIFIED BY 'matin@123';
  

### At this point newuser has no permissions to do anything with the databases.

In fact, even if newuser tries to login (with the password, password), they will not be able to reach the MySQL shell.

Therefore, the first thing to do is to provide the user with access to the information they will need.

     GRANT ALL PRIVILEGES ON * . * TO 'matin'@'localhost';
     GRANT ALL PRIVILEGES ON * . * TO 'matin'@'127.0.0.1';
     GRANT ALL PRIVILEGES ON * . * TO 'matin'@'*'; 


      FLUSH PRIVILEGES;



### CREATE MYSQL DATABASES AND USERS: 

      mysql -u root -p 
      mysql -u matin -p

      GRANT ALL PRIVILEGES ON *.* TO 'username'@'localhost' IDENTIFIED BY 'password';


 

## Export Import  In Server Using SSH/Terminal 


    mysql -u username -p -e "CREATE DATABASE new_dbname" 

    mysql -u <username> -p <databasename> < <filename.sql>
    Enter password directly (not secure):
    mysql -u <username> -p<PlainPassword> <databasename> < <filename.sql>

    Example:

      mysqldump -u username -p old_dbname > dbexport.sql
      mysqldump -u matin -p matin@123 mydb > ihwdb2019.sql
      
 ### Dumping Triggers / Skip Triggers in mysqldump
 

Hints:

   --triggers  (Used to take all the triggers)
   --skip-triggers (Used to skiping all the triggers)


Example:

      mysqldump -uusername -ppassword db_name --triggers > export_filename.sql
      mysqldump -uusername -ppassword db_name --routines --skip-triggers > export_filename.sql


- To import the data from the old database into the new database that you created in step 1, type the following command. Replace username with the MySQL username, and replace new_dbname with the name of the new database:

      mysql -u username -p database_name < /path/to/file.sql
      mysql -u username -p new_dbname < dbimport.sql
      mysql -u matin -pmatin@123 mydb < mydbfile.sql 

      mysql -u username -p -e "DROP DATABASE old_dbname" 
      
### Step1: Install PDO module

      sudo apt-get install php7.4-mysql
     #Enable PDO module
      phpenmod pdo_mysql




### Log cleaning in Magento 2 
 

      SET foreign_key_checks = 0;
      TRUNCATE customer_log;
      TRUNCATE customer_visitor;
      TRUNCATE report_compared_product_index;
      TRUNCATE report_event;
      TRUNCATE report_event_types;
      TRUNCATE report_viewed_product_aggregated_daily;
      TRUNCATE report_viewed_product_aggregated_monthly;
      TRUNCATE report_viewed_product_aggregated_yearly;
      TRUNCATE report_viewed_product_index;
      TRUNCATE product_alert_stock;
      TRUNCATE search_query;
      TRUNCATE catalogsearch_fulltext_scope1;
      TRUNCATE sales_bestsellers_aggregated_yearly;
      TRUNCATE sales_bestsellers_aggregated_monthly;
      TRUNCATE sales_bestsellers_aggregated_daily;
      SET foreign_key_checks = 1;

## Create DB

      mysql> CREATE DATABASE testdb;
      SHOW CREATE DATABASE testdb;
      
      
## REMOVE MYSQL FROM UBUNTU

      sudo apt-get remove --purge mysql* -y
      sudo apt-get purge mysql* -y
      sudo apt-get autoremove -y
      sudo apt-get autoclean -y
      sudo apt-get remove dbconfig-mysql -y
      sudo apt-get dist-upgrade -y
      
      rm -rf /etc/mysql
      sudo find / -iname 'mysql*' -exec rm -rf {} \;
      
      
      
### Ref
 

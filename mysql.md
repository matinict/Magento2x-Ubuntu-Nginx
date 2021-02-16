## MySQL  



### Step 1 –Install it on Ubuntu 20.04 LTS:

      sudo apt search mysql-server
      sudo apt info mysql-server
      
      sudo apt install mysql-server
 
### Step 2 – Securing MySQL server

      sudo mysql_secure_installation
 
This script will ask if you want to configure the VALIDATE PASSWORD PLUGIN.

Warning: Enabling this feature is something of a judgment call. If enabled, passwords which don’t match the specified criteria will be rejected by MySQL with an error. This will cause issues if you use a weak password in conjunction with software which automatically configures MySQL user credentials, such as the Ubuntu packages for phpMyAdmin. It is safe to leave validation disabled, but you should always use strong, unique passwords for database credentials.

Answer Y for yes, or anything else to continue without enabling.

VALIDATE PASSWORD PLUGIN can be used to test passwords
and improve security. It checks the strength of password
and allows the users to set only those passwords which are
secure enough. Would you like to setup VALIDATE PASSWORD plugin?

Press y|Y for Yes, any other key for No:
If you’ve enabled validation, the script will also ask you to select a level of password validation. Keep in mind that if you enter 2 – for the strongest level – you will receive errors when attempting to set any password which does not contain numbers, upper and lowercase letters, and special characters, or which is based on common dictionary words.

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

If using the auth_socket plugin to access MySQL fits with your workflow, you can proceed to Step 3. If, however, you prefer to use a password when connecting to MySQL as root, you will need to switch its authentication method from auth_socket to mysql_native_password. To do this, open up the MySQL prompt from your terminal:

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

      ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
      FLUSH PRIVILEGES;
 
Check the authentication methods employed by each of your users again to confirm that root no longer authenticates using the auth_socket plugin:

      SELECT user,authentication_string,plugin,host FROM mysql.user;
 

```
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
```
You can see in this example output that the root MySQL user now authenticates using a password. Once you confirm this on your own server, you can exit the MySQL shell:

exit
 
Note: After configuring your root MySQL user to authenticate with a password, you’ll no longer be able to access MySQL with the sudo mysql command used previously. Instead, you must run the following:

      mysql -u root -p
 
After entering the password you just set, you will see the MySQL prompt.

At this point, your database system is now set up and you can move on to installing PHP


### How to Create a New User 

```
   # sudo mysql -u root -p
   CREATE USER 'matin'@'localhost' IDENTIFIED BY 'matin@123';
   CREATE USER 'matin'@'127.0.0.1' IDENTIFIED BY 'matin@123';
   CREATE USER 'matin'@'*' IDENTIFIED BY 'matin@123';
  ```

### At this point newuser has no permissions to do anything with the databases.

In fact, even if newuser tries to login (with the password, password), they will not be able to reach the MySQL shell.

Therefore, the first thing to do is to provide the user with access to the information they will need.

     GRANT ALL PRIVILEGES ON * . * TO 'matin'@'localhost';
     GRANT ALL PRIVILEGES ON * . * TO 'matin'@'127.0.0.1';
     GRANT ALL PRIVILEGES ON * . * TO 'matin'@'*';


The asterisks in this command refer to the database and table (respectively) that they can access—this specific command allows to the user to read, edit, execute and perform all tasks across all the databases and tables.Please note that in this example we are granting newuser full root access to everything in our database. While this is helpful for explaining some MySQL concepts, it may be impractical for most use cases and could put your database’s security at high risk.Once you have finalized the permissions that you want to set up for your new users, always be sure to reload all the privileges.


      FLUSH PRIVILEGES;



### CREATE MYSQL DATABASES AND USERS:

To create MySQL database and users, follow these steps:

At the command line, log in to MySQL as the root user:

      mysql -u root -p
      
Type the MySQL root password, and then press Enter.
To create a database user, type the following command. Replace username with the user you want to create, and replace password with the user's password:

      GRANT ALL PRIVILEGES ON *.* TO 'username'@'localhost' IDENTIFIED BY 'password';


 

## Export Import  In Server Using SSH/Terminal


- Log in to your server using SSH.At the command prompt, type the following command to create a new database. Replace username with the MySQL username, and replace new_dbname with the new database name that you want to use:


      mysql -u username -p -e "CREATE DATABASE new_dbname"

- To export the old database to a file, type the following command. Replace username with the MySQL username, and replace old_dbname with the name of the database that you want to rename:
Prompt for password:

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

- To delete the old database, type the following command. Replace username with the MySQL username, and replace old_dbname with the name of the database to delete:

      mysql -u username -p -e "DROP DATABASE old_dbname"
      

- This step is optional. You do not have to delete the old database.You can now use the new database named new_dbname, which contains all of the tables and data from the old database.


### Log cleaning in Magento 2
Running below SQL query in your database

 

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
 

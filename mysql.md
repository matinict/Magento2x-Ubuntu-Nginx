## MySQL  

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



### CREATE MYSQL DATABASES AND USERS
To create MySQL database and users, follow these steps:

At the command line, log in to MySQL as the root user:
mysql -u root -p
Type the MySQL root password, and then press Enter.
To create a database user, type the following command. Replace username with the user you want to create, and replace password with the user's password:

GRANT ALL PRIVILEGES ON *.* TO 'username'@'localhost' IDENTIFIED BY 'password';



### import a database with MySQL from terminal?

 
  ``` 
    Prompt for password:
    mysql -u <username> -p <databasename> < <filename.sql>

    Enter password directly (not secure):
    mysql -u <username> -p<PlainPassword> <databasename> < <filename.sql>

    Example:

    mysql -u c -p ihwqdb1 < database_porto2_3.2.1.sql
    mysql -u matin -p matin@12 ihwqdb1 < database_porto2_3.2.1.sql
  ```
  
  
  
  
### Ex
```
   mysqldump -u matin -p matin@123 ihwdb > ihwdb2019.sql
```

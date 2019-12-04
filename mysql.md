## MySQL


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

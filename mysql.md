## MySQL


### import a database with MySQL from terminal?

 
  ``` 
    Prompt for password:
    mysql -u <username> -p <databasename> < <filename.sql>

    Enter password directly (not secure):
    mysql -u <username> -p<PlainPassword> <databasename> < <filename.sql>

    Example:

    mysql -u matin -p ihwqdb1 < database_porto2_3.2.1.sql
    mysql -u matin -p matin@12 ihwqdb1 < database_porto2_3.2.1.sql
  ```

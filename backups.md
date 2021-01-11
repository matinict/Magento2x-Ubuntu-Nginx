# Backups


## Create a Backup
On the Admin sidebar, 

     go to System > Tools > Backups.
    
In the upper-right corner, click the button for the type of backup you want to create:

System Backup	Creates a complete backup of the database and the file system. During the process, you can choose to include the media folder in the backup.
Database and Media Backup	Creates a backup of the database and the media folder.
Database Backup	Creates a backup of the database.
To put the store into maintenance mode during the backup, select the checkbox.

When the backup is complete, maintenance mode is turned off automatically.For a system backup, select the Include Media folder to System Backup checkbox if you want to include the media folder. When prompted, confirm the action.


## Schedule Backups: 
On the Admin sidebar, go to Stores > Settings > Configuration.In the left panel, expand Advanced and choose System. Expand Expansion selector the Backup Settings section and do the following:

  Set Enabled Schedule Backup to Yes.
  Set the Scheduled Backup Type.
  Set the Start Time.
  Set the Frequency.
  Set Maintenance Mode to Yes.
  When complete, click Save Config.

## Ref

https://docs.magento.com/user-guide/system/backups.html

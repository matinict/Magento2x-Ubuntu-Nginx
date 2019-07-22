Sample Data Install using Composer:

Step 1: Magento CLI
Make sure that Magento CLI path is exported. From store’s webroot,
Issue the following command if Magento CLI’s path is not exported.

export PATH=$PATH:$(pwd)/bin
Step 2: Installation of Sample Data
Change your current directory to Magento’s Webroot and execute the following command:

magento sampledata:deploy
There may be a chance that you will face error about URL authentication to repo.magento.com. 
If this is true, then execute “composer update” command. 
It will ask you for the username password which we’ve created from Magento Connect Account section.

Step 3: Finalize Installation
We will now use “magento setup:upgrade” command which will re-compile the code and will clear the cache.

magento setup:upgrade
Your Magento store is now ready for you to start testing with sample data. 
You can add products, delete products, try out the payment systems, and test your server load as well. 
If you have any issue in this process, you can comment below and I would be glad to help you out with the issue.




Ref:

https://devdocs.magento.com/guides/v2.3/install-gde/install/sample-data-after-composer.html

https://www.cloudways.com/blog/how-to-install-sample-data-in-magento-2/

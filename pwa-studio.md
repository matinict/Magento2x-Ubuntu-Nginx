# How to install PWA for Magento 2.4x at local environment.

## Magento PWA Studio Introduction

### 1. PWA Started Setup Storefront project

       - First install [Magento2.4](m24.md)
       - install [Node](node.md) or 
       - install [Yarn](yarn.md)
 
        
        
### 1.1b Node

        node -v
        npm init @magento/pwa        
        npm init @magento/pwa     
       
       ? Project root directory: pwa-spider       
       ? Short name : [Enter]      
       ? Name of the author :  [Enter]        
       ? Which template :  [Enter]        
       ? Magento instance to use:  [Enter]        
       ? URL: https://magento2.localhost       
       ? Edition of the magento :MOS    
       ? Braintree API :[Enter]        
       ? NPM package: NPM    
       ? Install package : No       
       
       ##Running command:        
       buildpack create-project pwa-spider --name "pwa-spider" --author "matin" --template "@magento/venia-concept" --backend-url "https://magento2.localhost" --backend-edition "CE" --braintree-token "sandbox_8yrzsvtm_s2bg8fs563crhqzk" --npm-client "npm" --no-install


       npm run buildpack -- create-custom-origin .  
       npm run watch   
       npm run storybook      
       npm run build     
       npm start  

       export NODE_OPTIONS=--openssl-legacy-provider


    

### Install Venia sample data

       composer config --no-interaction --ansi repositories.venia-sample-data composer https://repo.magento.com
       composer require --no-interaction --ansi magento/venia-sample-data:*
       bin/magento setup:upgrade
       bin/magento indexer:reindex

         
### Node 

       nvm use 20.0.0 
       
       curl -sL https://deb.nodesource.com/setup_19.x -o nodesource_setup.sh
       nano nodesource_setup.sh
       sudo bash nodesource_setup.sh
       sudo apt install nodejs
       curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh
       curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
       source ~/.bashrc
       nvm list-remote
       nvm install v20.0.0
       nvm list
       nvm install lts/fermium
       nvm install lts/Gallium
       nvm install lts/Hydrogen

       nvm alias default v20.0.0
       nvm alias default node2

       node -v


       npm run clean:all
       npm install
       npm run build


        
        
 ### 1.1a Yarn

       yarn -v
       yarn create @magento/pwa

       # check NPN   ...   
       cd pwa-studio-fundamentals 
       - yarn run buildpack create-custom-origin  
       - yarn run watch  
       - yarn run storybook  
       - yarn run build  
       - yarn start 

       yarn buildpack create-custom-origin ./
       yarn watch
       yarn run watch:all

     
     
     ## Issue body start top
     "start": "react-scripts --openssl-legacy-provider start"
     
     
       # Isuue in magento root :
       composer require magento/pwa 
       php bin/magento module:enable --clear-static-content Magento_ContactGraphQlPwa
       php bin/magento module:enable --clear-static-content Magento_NewsletterGraphQlPwa
       php bin/magento module:enable --clear-static-content Magento_QuoteGraphQlPwa
       php bin/magento set:up
       cd pwa-studio-fundamentals 




# 1.2 Clone the PWA Studio repository 

       git clone https://github.com/magento/pwa-studio.git
       
       cd pwa-studio/
       yarn install
       yarn buildpack create-custom-origin packages/venia-concept

 ## 1.4 Run the server
      yarn run watch:venia        
       yarn run watch:all
       yarn run build && yarn run stage:venia

## 1.5 Browsing to the application
       https://magento-venia-concept-abcde.local.pwadev:8001
       OR
       Launching staging server... 
       https://magento-venia-concept-abcde.local.pwadev:51828/
       or 
       http://0.0.0.0:44067

 
## Problem


#### Problem-01: Error from chokidar ( pwa/node_modules/@magento/venia-ui/lib/components/AccountMenu): Error: ENOSPC: System limit for number of file watchers reached

Solution:

        sudo sysctl -w fs.inotify.max_user_watches=524288

#### Problem-02: Error: ENOENT: no such file or directory, stat ' /pwa/2f18a153658f03f6428e.hot-update.json'

Solution:


#### Problem-03 Error: This package doesn't seem to be present in your lockfile; run "yarn install" to update the lockfile

npm config set strict-ssl false

npm config set strict-ssl false
npm config get strict-ssl

### Problem-04: Error: error:0308010C:digital envelope routines::unsupportedat new Hash

Solution:

export NODE_OPTIONS=--openssl-legacy-provider


### Problem-05: Error: Cannot query field "newsletter_enabled" on type "StoreConfig". (... 1 errors total)

Solution:

       composer require magento/pwa
       then :
       php bin/magento module:enable Magento_ContactGraphQlPwa Magento_NewsletterGraphQlPwa Magento_QuoteGraphQlPwa --clear-static-content  
       
       
### Problem-06: Product not showing on PWA  ex http://0.0.0.0:10000/kaffee.html?page=1

Solution:

       composer config --no-interaction --ansi repositories.venia-sample-data composer https://repo.magento.com
       composer require --no-interaction --ansi magento/venia-sample-data:*
       php bin/magento setup:upgrade
       php bin/magento indexer:reindex

       #composer require magento/venia-sample-data


 
## Ref

https://developer.adobe.com/commerce/pwa-studio/guides/packages/venia/sample-data/

https://developer.adobe.com/commerce/pwa-studio/tutorials/

https://webkul.com/blog/magento2-3-pwa-studio-setup/
https://swissuplabs.com/blog/how-to-start-using-magento-2-pwa-studio-on-your-hosting-a-complete-guide/

[here](https://magento.github.io/pwa-studio/)

https://developer.adobe.com/commerce/pwa-studio/tutorials/setup-storefront/

https://www.youtube.com/watch?v=X4COzBXVpBM

https://magento.github.io/pwa-studio/venia-pwa-concept/setup/

https://magento.github.io/pwa-studio/venia-pwa-concept/install-sample-data/

https://webscoot.io/blog/magento-pwa-guide/
https://alanstorm.com/magento-pwa-studio-react-upward/



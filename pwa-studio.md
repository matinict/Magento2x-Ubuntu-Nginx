# How to install PWA for Magento 2.4x at local environment.

## Magento PWA Studio Introduction

### 1. PWA Started Setup Storefront project

       - First install [Magento2.4](m24.md)
       - install [Node](node.md) or 
       - install [Yarn](yarn.md)


       
### 1.1a Yarn

       yarn -v
       yarn create @magento/pwa

       # Comand promp         
       @magento/create-pwa v2.2.0
       Creating a PWA Studio project
       ? Project root directory : pwa-studio-fundamentals  
       ? Short name of the project to put in the package.json "name" field:  [Press Enter]
       ? Name of the author to put in the package.json "author" field:   [Press Enter]
       ? Which template would you like to use to bootstrap pwa-studio-fundamentals? 
       Defaults to "@magento/venia-concept". @magento/venia-concept: [Press Enter]
       ? Magento instance to use as a backend (will be added to `.env` file): 2.4-develop
       ? Edition of the magento store (Enterprise Edition or Community Edition): CE
       ? Braintree API token to use to communicate with your Braintree instance 
       (will be added to `.env` file) sandbox_8yrzsvtm_s2bg8fs563crhqzk: [Press Enter]
       ? NPM package management client to use: yarn [Select yarn]
       ? Install package dependencies with yarn after creating project: Yes [Press Y]


       ## Created new PWA project pwa-studio-fundamentals. Next steps:
       cd pwa-studio-fundamentals
       #to generate a unique, secure custom domain for your new project. Highly recommended.
       - yarn run buildpack create-custom-origin 
       #to start the dev server and do real-time development.
       - yarn run watch 
       #to start Storybook dev server and view available components in your app.
       - yarn run storybook 
       #to build the project into optimized assets in the '/dist' directory.
       - yarn run build 
       #after build to preview the app on a local staging server.
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




        
        
### 1.1b Node

        node -v
        npm init @magento/pwa
        
        npm init @magento/pwa
        
       @magento/create-pwa v2.3.1
       
       Creating a PWA Studio project
       
       ? Project root directory (will be created if it does not exist) pwa-spider
       
       ? Short name of the project to put in the package.json "name" field pwa-spider
       
       ? Name of the author to put in the package.json "author" field matin
       
       ? Which template would you like to use to bootstrap pwa-spider? Defaults to "@magento/venia-concept". @magento/venia-concept
       
       ? Magento instance to use as a backend (will be added to `.env` file) Other
       
       ? URL of a Magento instance to use as a backend (will be added to `.env` file) https://magento2.localhost
       
       ? Edition of the magento store (Adobe Commerce or Magento Open Source) CE
       
       ? Braintree API token to use to communicate with your Braintree instance (will be added to `.env` file) sandbox_8yrzsvtm_s2bg8fs563crhqzk
       
       ? NPM package management client to use npm
       
       ? Install package dependencies with npm after creating project No
       
       
       Running command: 
       
       buildpack create-project pwa-spider --name "pwa-spider" --author "matin" --template "@magento/venia-concept" --backend-url "https://magento2.localhost" --backend-edition "CE" --braintree-token "sandbox_8yrzsvtm_s2bg8fs563crhqzk" --npm-client "npm" --no-install


       npm run buildpack -- create-custom-origin . to generate a unique, secure custom domain for your new project. Highly recommended.       
       npm run watch to start the dev server and do real-time development.       
       npm run storybook to start Storybook dev server and view available components in your app.       
       npm run build to build the project into optimized assets in the '/dist' directory.       
       npm start after build to preview the app on a local staging server.

              export NODE_OPTIONS=--openssl-legacy-provider


       
       
         ℹ  Finding @magento/venia-concept tarball on NPM
         ℹ  Downloading and unpacking https://registry.npmjs.org/@magento/venia-concept/-/venia-concept-12.5.0.tgz
         ℹ  Unpacked @magento/venia-concept
         ℹ  Creating a new PWA project 'pwa-spider' in pwa-spider
         ⚠  Created new PWA project pwa-spider. Next steps:

            - cd pwa-spider && npm install before running the below commands.

            - npm run buildpack -- create-custom-origin . to generate a unique, secure custom domain for your new project. Highly recommended.

            - npm run watch to start the dev server and do real-time development.

            - npm run storybook to start Storybook dev server and view available components in your app.

            - npm run build to build the project into optimized assets in the '/dist' directory.

            - npm start after build to preview the app on a local staging server.

         ℹ  Successfully wrote a fresh configuration file to /srv/public_html/pwa-spider/.env


         
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


        
        
 


# 1.2 Clone the PWA Studio repository 

       git clone https://github.com/magento/pwa-studio.git
       
       cd pwa-studio/
       yarn install
       yarn buildpack create-custom-origin packages/venia-concept

 ## 1.4 Run the server
       #Use any of the following commands from the project root directory to start the server:
       
       yarn run watch:venia
       #Starts the Venia storefront development environment.
       
       yarn run watch:all
       #Runs the full PWA Studio developer experience, which include Venia hot-reloading and concurrent Buildpack/Peregrine rebuilds.
       
       yarn run build && yarn run stage:venia
       #Generates build artifacts and runs the staging environment, which uses more compressed assets and more closely reflects production.

## 1.5 Browsing to the application
After the development server is up and running, look for a similar line in the terminal output (the port may differ for your instance):
PWADevServer ready at https://magento-venia-concept-abcde.local.pwadev:8001
OR
Launching staging server... 
https://magento-venia-concept-abcde.local.pwadev:51828/




### Problem 

 #### Problem-1 Error from chokidar ( pwa/node_modules/@magento/venia-ui/lib/components/AccountMenu): Error: ENOSPC: System limit for number of file watchers reached

 Solution:
 
        sudo sysctl -w fs.inotify.max_user_watches=524288

#### Problem2 Error: ENOENT: no such file or directory, stat ' /pwa/2f18a153658f03f6428e.hot-update.json'


#### Problem2 Error: This package doesn't seem to be present in your lockfile; run "yarn install" to update the lockfile

       npm config set strict-ssl false

       npm config set strict-ssl false
       npm config get strict-ssl


   
### My Final Video: 

https://www.youtube.com/watch?v=_pUZZNBjj6Y&feature=youtu.be
export NODE_TLS_REJECT_UNAUTHORIZED=0




[![M24 PWA](https://i9.ytimg.com/vi/_pUZZNBjj6Y/mq2.jpg?sqp=CNzYm_sF&rs=AOn4CLAvH7FeQDq3h-Ju-2vS5RsbreR-tQ)](https://youtu.be/_pUZZNBjj6Y "PWA")


## Ref

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



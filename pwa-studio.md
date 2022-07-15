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
       ? Project root directory (will be created if it does not exist): pwa-studio-fundamentals
       ? Short name of the project to put in the package.json "name" field: pwa-studio-fundamentals
       ? Name of the author to put in the package.json "author" field: Matin<matinict@gmail.com>
       ? Which template would you like to use to bootstrap pwa-studio-fundamentals? Defaults to "@magento/venia-concept". @magento/venia-concept
       ? Magento instance to use as a backend (will be added to `.env` file): 2.4-develop
       ? Edition of the magento store (Enterprise Edition or Community Edition): CE
       ? Braintree API token to use to communicate with your Braintree instance (will be added to `.env` file) sandbox_8yrzsvtm_s2bg8fs563crhqzk
       ? NPM package management client to use: yarn
       ? Install package dependencies with yarn after creating project: Yes
       
       
      ## Created new PWA project pwa-studio-fundamentals. Next steps:
     cd pwa-studio-fundamentals
     - yarn run buildpack create-custom-origin . to generate a unique, secure custom domain for your new project. Highly recommended.
     - yarn run watch to start the dev server and do real-time development.
     - yarn run storybook to start Storybook dev server and view available components in your app.
     - yarn run build to build the project into optimized assets in the '/dist' directory.
     - yarn start after build to preview the app on a local staging server.
     
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

        
        
 


# 1.2 Clone the PWA Studio repository 

git clone https://github.com/magento/pwa-studio.git

cd pwa-studio/
yarn install
yarn buildpack create-custom-origin packages/venia-concept

 ## 1.4 Run the server
Use any of the following commands from the project root directory to start the server:

       yarn run watch:venia
Starts the Venia storefront development environment.

yarn run watch:all
Runs the full PWA Studio developer experience, which include Venia hot-reloading and concurrent Buildpack/Peregrine rebuilds.

yarn run build && yarn run stage:venia
Generates build artifacts and runs the staging environment, which uses more compressed assets and more closely reflects production.

## 1.5 Browsing to the application
After the development server is up and running, look for a similar line in the terminal output (the port may differ for your instance):

PWADevServer ready at https://magento-venia-concept-abcde.local.pwadev:8001
OR

Launching staging server...

https://magento-venia-concept-abcde.local.pwadev:51828/

Staging server running at the address above.
This is the address for your PWA frontend. You can still use the old address to access the Admin section of Magento, but for PWA development on the frontend, use this new address.

Congratulations! You have set up your development environment for the Venia storefront project.


   
### My Final Video: 

https://www.youtube.com/watch?v=_pUZZNBjj6Y&feature=youtu.be


[![M24 PWA](https://i9.ytimg.com/vi/_pUZZNBjj6Y/mq2.jpg?sqp=CNzYm_sF&rs=AOn4CLAvH7FeQDq3h-Ju-2vS5RsbreR-tQ)](https://youtu.be/_pUZZNBjj6Y "PWA")


## Ref
https://webkul.com/blog/magento2-3-pwa-studio-setup/
https://swissuplabs.com/blog/how-to-start-using-magento-2-pwa-studio-on-your-hosting-a-complete-guide/

[here](https://magento.github.io/pwa-studio/)

https://developer.adobe.com/commerce/pwa-studio/tutorials/setup-storefront/

https://www.youtube.com/watch?v=X4COzBXVpBM

https://magento.github.io/pwa-studio/venia-pwa-concept/setup/

https://magento.github.io/pwa-studio/venia-pwa-concept/install-sample-data/

https://webscoot.io/blog/magento-pwa-guide/
https://alanstorm.com/magento-pwa-studio-react-upward/



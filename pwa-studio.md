# How to install PWA for Magento 2.4x at local environment.

## Magento PWA Studio Introduction

### 1. PWA Started Setup Storefront project

- First install [Magento2.4](m24.md)
- install [Node](node.md) or 
-  install [Yarn](yarn.md)


        node -v
        
        npm init @magento/pwa

         
         yarn -v
         yarn create @magento/pwa


 


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

[here](https://magento.github.io/pwa-studio/)

https://developer.adobe.com/commerce/pwa-studio/tutorials/setup-storefront/

https://www.youtube.com/watch?v=X4COzBXVpBM

https://magento.github.io/pwa-studio/venia-pwa-concept/setup/

https://magento.github.io/pwa-studio/venia-pwa-concept/install-sample-data/

https://webscoot.io/blog/magento-pwa-guide/



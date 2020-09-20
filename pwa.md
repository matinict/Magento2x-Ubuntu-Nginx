# How to install PWA for Magento 2.4x at local environment.

## Magento PWA Studio Introduction

### 1. What Is PWA?
PWA stands for  Progressive Web App, is a web application using modern web technologies and design models to bring a reliable, fast, and engaging user experience. 

A website with PWA technology features very fast, secure, responsive, and compatible across browsers. It can run offline and perform like a native app on mobile. Visit [here](https://magento.github.io/pwa-studio/) for technical Magento PWA Documentation. 




## 1.1 Install Magento2.4
- First install [Magento2.4](m24.md)

 
## 1.2 Clone the PWA Studio repository
Clone the PWA Studio repository into your development environment.

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


  
  
  https://youtu.be/_pUZZNBjj6Y


## Ref

https://www.youtube.com/watch?v=X4COzBXVpBM

https://magento.github.io/pwa-studio/venia-pwa-concept/setup/

https://magento.github.io/pwa-studio/venia-pwa-concept/install-sample-data/

https://webscoot.io/blog/magento-pwa-guide/



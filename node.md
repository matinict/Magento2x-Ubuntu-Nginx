
# Node

## Prerequisites 

- Ubuntu 
- non-root user account with sudo privileges 


##  Installing

- Installing Node.js with Apt from the Default Repositories

        sudo apt update
        sudo apt install nodejs
        node -v
        sudo apt install npm


- Installing Node.js with Apt Using a NodeSource PPA

      cd ~
      curl -sL https://deb.nodesource.com/setup_16.x -o nodesource_setup.sh

      ##Inspect the contents of the downloaded script
      nano nodesource_setup.sh

      sudo bash nodesource_setup.sh
      sudo apt install nodejs
      node -v
      ##Output v16.6.1







## Ref

https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-20-04



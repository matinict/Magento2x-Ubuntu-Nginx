
# Node

## Prerequisites 

- Ubuntu 
- non-root user account with sudo privileges 


##  Installing

- Installing Node.js with Apt from the Default Repositories

        sudo apt -y update && sudo apt upgrade
        sudo apt -y install nodejs
        node -v
        ##v10.19.0
        sudo apt -y install npm
        
        # Short Way
        sudo apt -y update && sudo apt install nodejs npm 

        curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
        sudo apt-get install -y nodejs
  

        curl -fsSL https://deb.nodesource.com/setup_19.x | sudo -E bash -
        sudo apt-get install -y nodejs
  
        curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
        sudo apt-get install -y nodejs
        
        curl -fsSL https://deb.nodesource.com/setup_17.x | sudo -E bash -
        sudo apt-get install -y nodejs
        
        curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
        sudo apt-get install -y nodejs

        npm install -g npm@latest
        
 
            node -v


- Installing Node.js with Apt Using a NodeSource PPA

      cd ~
      curl -sL https://deb.nodesource.com/setup_16.x -o nodesource_setup.sh

      ##Inspect the contents of the downloaded script
      nano nodesource_setup.sh

      sudo bash nodesource_setup.sh
      sudo apt install nodejs
      node -v
      ##Output v16.6.1
 
- Installing Node Using the Node Version Manager

        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
        wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash



##  Remove Node/NPM

        sudo apt-get -y remove nodejs  
        sudo apt-get -y purge nodejs 
        sudo apt-get -y purge nodejs npm
        sudo apt -y autoremove
        sudo apt -y update 
        
        sudo rm -rf /usr/local/bin/npm /usr/local/share/man/man1/node* ~/.npm
        sudo rm -rf /usr/local/lib/node*
        sudo rm -rf /usr/local/bin/node*
        sudo rm -rf /usr/local/include/node*

      



## Trubleshot 

        npm install semver


## Ref

https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-20-04

https://github.com/nodesource/distributions/blob/master/README.md
https://nodejs.org/en/download/package-manager


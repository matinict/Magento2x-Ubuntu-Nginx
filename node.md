
# Node

## Prerequisites 

- Ubuntu 
- non-root user account with sudo privileges 


##  Installing

- Installing Node.js with Apt from the Default Repositories

        sudo apt -y update
        sudo apt -y install nodejs
        node -v
        ##v10.19.0
        sudo apt -y install npm
        
        
        npm install -g npm@latest


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

        sudo rm -rf /usr/local/bin/npm /usr/local/share/man/man1/node* ~/.npm
        sudo rm -rf /usr/local/lib/node*
        sudo rm -rf /usr/local/bin/node*
        sudo rm -rf /usr/local/include/node*

        sudo apt-get -y purge nodejs npm
        sudo apt -y autoremove
        sudo apt -y update 


## Trubleshot 

        npm install semver


## Ref

https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-20-04



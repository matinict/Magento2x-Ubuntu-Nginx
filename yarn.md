## yarn

### Install

        sudo apt-get install yarn


### Remove & Re Install

        sudo apt remove cmdtest
        sudo apt remove yarn
        yarn -v
        #> 1.15.2
        which yarn
        #/usr/bin/yarn
        sudo rm -rf /usr/bin/yarn
        sudo npm uninstall --global yarn; 
        
       
        
        curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
        echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
        sudo apt-get update && sudo apt-get install yarn
         npm install --global yarn

        yarn upgrade --latest
        yarn upgrade left-pad --latest
        yarn upgrade left-pad grunt --latest --tilde

### Commands
        yarn version --major
        yarn version --minor
        yarn version --patch
        yarn version --premajor
        yarn version --preminor
        yarn version --prepatch
        yarn version --prerelease
        yarn version --no-git-tag-version
        yarn version --no-commit-hooks
        
### Ref

https://classic.yarnpkg.com/en/docs/cli/

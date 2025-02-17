# Ubuntu


### Prerequisites 

- RAM:4GB
- HD : 30GB  


### Installing

- Bootable OS


### check your current Ubuntu version

        cat /etc/*release  
        
### Fix Broken  Package 

        sudo apt --fix-broken install

### Change swap size in Ubuntu 18.04 or newer

        sudo swapoff -a 
        sudo dd if=/dev/zero of=/swapfile bs=1G count=8 
        sudo chmod 600 /swapfile 
        sudo mkswap /swapfile 
        sudo swapon /swapfile

        Edit /etc/fstab and add the new swapfile if it isn’t already there

        /swapfile none swap sw 0 0

        Check the amount of swap available:

        sudo swapon --show
        sudo free -h
        grep SwapTotal /proc/meminfo



        sudo swapon --show
        sudo swapoff -a 
        sudo dd if=/dev/zero of=/swapfile bs=1G count=16
        sudo fallocate -l 3G /swapfile
        sudo dd if=/dev/zero of=/swapfile bs=3082 count=3048576
        sudo chmod 600 /swapfile
        sudo mkswap /swapfile
        sudo swapon /swapfile
        sudo nano /etc/fstab
        sudo swapon --show
        sudo free -h
        cat /proc/sys/vm/swappiness
        sudo sysctl vm.swappiness=10
        free -m

        sudo service elasticsearch start
        curl -X GET 'http://localhost:9200'
        free -m
## s


In the following example, we’ll extend the swap space available in the /swapfile from 4 GB to 8 GB.

Turn off all swap processes
 
        sudo swapoff -a
2. Resize the swap
 
        sudo dd if=/dev/zero of=/swapfile bs=1G count=8
if = input file
of = output file
bs = block size
count = multiplier of blocks

3. Change permission
 
        sudo chmod 600 /swapfile
4. Make the file usable as swap

 
          sudo mkswap /swapfile
5. Activate the swap file

1
sudo swapon /swapfile
6. Edit /etc/fstab and add the new swapfile if it isn’t already there

        /swapfile none swap sw 0 0
        
7. Check the amount of swap available 

        grep SwapTotal /proc/meminfo

### Updating Ubuntu Kernel

        cat /etc/apt/sources.list
        uname -r
        uname -mrs 
        #Linux 4.4.0-64 generic
        sudo add-apt-repository ppa:cappelikan/ppa -y
        sudo apt install mainline -y
        
        sudo apt update && sudo apt upgrade -y
        sudo apt-get dist-upgrade -y
        update-manager –d
        sudo reboot
   


### CLI Short/ alias: 
        
        nano  ~/.bashrc
        source ~/.bashrc
        alias html="cd /var/www/html"
        alias shopify="cd /var/www/html/shopify"
        alias cl="clear"          
        alias u2="sudo apt update -y"
        alias u3="sudo apt update && sudo apt upgrade -y"
        alias uf="sudo apt --fix-broken install -y"
        alias ur="sudo apt autoremove -y"
        alias upg="apt list --upgradable -y"
        alias h="history"
        alias cu="composer update"
        alias cui="composer update --ignore-platform-reqs"
        #Git
        alias gb="git branch"
        
        #PHP
        alias pv=" php -v"
        alias pvs="sudo update-alternatives --config php"
        
        

### Search

        grep -R "what" "where"
        grep -R "78048 Villingen-Schwenningen" .
        grep -R "minicart.js" .
        grep -R "apple-black-logo-bFu.svg" .
        grep -R "catalog_product_index_eav_temp.PRIMARY" .

### Ubuntu 23.04

   

### Ref
- https://ubuntu.com/download/desktop




## Change swap size in Ubuntu 18.04 or newer

        sudo swapoff -a 
        sudo dd if=/dev/zero of=/swapfile bs=1G count=8 
        sudo chmod 600 /swapfile 
        sudo mkswap /swapfile 
        sudo swapon /swapfile
        
        Edit /etc/fstab and add the new swapfile if it isn’t already there
        1
        /swapfile none swap sw 0 0
        
        Check the amount of swap available
        grep SwapTotal /proc/meminfo




## Change swap size in Ubuntu 18.04 or newer

        sudo swapoff -a 
        sudo dd if=/dev/zero of=/swapfile bs=1G count=8 
        sudo chmod 600 /swapfile 
        sudo mkswap /swapfile 
        sudo swapon /swapfile
        
        Edit /etc/fstab and add the new swapfile if it isn’t already there
        1
        /swapfile none swap sw 0 0
        
        Check the amount of swap available:
        
        sudo swapon --show
        sudo free -h
        grep SwapTotal /proc/meminfo
        
        
        
     sudo swapon --show
     sudo swapoff -a 
     sudo dd if=/dev/zero of=/swapfile bs=3G count=8 
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




## SSH Key


### RSA SSH keys 

      ## Genarate 
      ssh-keygen -t rsa -b 2048 -C "email@example.com"
      ssh-keygen -t rsa -b 2048 -C "matinict@gmail.com"
      ssh-keygen -t rsa -b 4096 -C "matin@eongroup.com.bd" 
      
      ## Config
      nano /home/matin/.ssh/config      
      ## Add for SSH-aws:ssh aws.ecom
      Host aws.ecom
         HostName ip.136.241.xx
         User ubuntu
         IdentityFile ~/.ssh/id_rsa

 

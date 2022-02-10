

## SSH Key



### Ed25519:

    ssh-keygen -t ed25519 -C "matinict@gmail.com"
    eval "$(ssh-agent -s)"p
    ssh-add ~/.ssh/id_edch
    cat ~/.ssh/id_ed25519.pub

 

### RSA SSH keys 

      ## Genarate 
      ssh-keygen -t rsa -b 2048 -C "email@example.com"
      ssh-keygen -t rsa -b 2048 -C "matinict@gmail.com" 
      
      ## Config
      nano /home/matin/.ssh/config      
      ## Add for SSH-aws:ssh aws.com
      Host aws.com
         HostName ip.136.241.xx
         User matin
         IdentityFile ~/.ssh/id_rsa
         
 ###  SSH Access copy to gitlab setup
      ssh-keygen -o -f ~/.ssh/id_rsa
      chmod 400 ~/.ssh/id_rsa
      cat ~/.ssh/id_rsa.pub

 


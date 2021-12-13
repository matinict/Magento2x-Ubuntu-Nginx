

## SSH Key


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

 
### Add Origin SSH Access

      git remote -v
      git remote remove origin
      git remote add origin git@gitlab.com:kpd-i/nucap/spidertech.git




## PHP Mail Install and Configure    Ubuntu 

## Step 1 — Installing Postfix 

    sudo apt-get update 
    sudo apt install mailutils
    
Promt ==> Internet Site  Near the end of the installation process, you will be presented with a window that looks exactly like the one in the image below. The default option is Internet Site. That’s the recommended option for this tutorial, so press TAB, then ENTER.

## Step 2 — Configuring Postfix 

    sudo nano /etc/postfix/main.cf  

    /etc/postfix/main.cf
    . . .
    mailbox_size_limit = 0
    recipient_delimiter = +
    inet_interfaces = all 
 
    ##Change the line that reads inet_interfaces = all to inet_interfaces = loopback-only. 
    mailbox_size_limit = 0
    recipient_delimiter = +
    inet_interfaces = loopback-only 
    # similar to these: 
    mydestination = $myhostname, example.com, localhost.com, , localhost
    
    # recommended defaults for that scenario are given in the code block below, so modify yours to match: 
    mydestination = $myhostname, localhost.$mydomain, $mydomain
    . . .
    #Save and close the file.
    sudo systemctl restart postfix
    
## Step 3 — Testing the SMTP Server

     echo "This is the body of the email" | mail -s "This is the subject line" matinict@gmail.com    
     postconf -p | grep comp
  

## Step 4 — Forwarding System Mail 

    sudo nano /etc/aliases      
    /etc/aliases    
    #See man 5 aliases for format    
    postmaster:    root
 
    #system generated emails are sent to the root user.  rerouted to your email addres  edit the file so that it reads:
    /etc/aliases
    # See man 5 aliases for format
    postmaster:    root
    root:          info@eonbazar.com    
    #Replace your_email_address with your personal email address.     
    sudo newaliases
 
You may now test that it works by sending an email to the root account using:

    echo "This is the body of the email" | mail -s "This is the subject line" root
    # should receive the email at your email address. If not, check your spam folder.
    echo "This is the body of the email" | mail -s "This is the subject line" matinict@gmail.com

## Step 5 Recheck log

     postconf -p | grep comp
     
     cat /var/log/mail.log
     tail -f /var/log/mail.log
     # check port
     sudo ufw status
     
     telnet portquiz.net 587
     netstat -plant | grep 587
     
     iptables -I INPUT -p tcp -m tcp --dport 25 -j ACCEPT
     sudo ufw allow 25/tcp
     sudo ufw allow Postfix
     
     sudo service nginx reload
     
     
#  Sendmail Mail Install and Configure    Ubuntu 

## Step 1;

    sudo systemctl stop postfix
    sudo apt remove postfix && apt purge postfix
    sudo apt install sendmail
    sudo sendmailconfig
    
    sudo nano /etc/mail/sendmail.mc
    dnl DAEMON_OPTIONS(`Family=inet,  Name=MTA-v4, Port=smtp, Addr=127.0.0.1')dnl
    dnl DAEMON_OPTIONS(`Family=inet,  Name=MSP-v4, Port=submission, M=Ea, Addr=127.0.0.1')dnl
    
    cat /etc/mail/local-host-names
        tecadmin.net
        mail.tecadmin.net
        localhost
        localhost.localdomain
        
    sudo m4 /etc/mail/sendmail.mc > /etc/mail/sendmail.cf
    sudo systemctl restart sendmail
    
    sudo makemap hash /etc/mail/virtusertable < /etc/mail/virtusertable
    sudo /etc/init.d/sendmail restart
    

## Ref


https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-postfix-as-a-send-only-smtp-server-on-ubuntu-16-04

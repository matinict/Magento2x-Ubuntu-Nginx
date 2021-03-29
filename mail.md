
# Install and Configure  Mail Ubuntu 

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
    . . .
 
Change the line that reads inet_interfaces = all to inet_interfaces = loopback-only.

    /etc/postfix/main.cf
    . . .
    mailbox_size_limit = 0
    recipient_delimiter = +
    inet_interfaces = loopback-only
    . . .
 similar to these:

    /etc/postfix/main.cf
    . . .
    mydestination = $myhostname, example.com, localhost.com, , localhost
    . . .
The recommended defaults for that scenario are given in the code block below, so modify yours to match:

    /etc/postfix/main.cf
    . . .
    mydestination = $myhostname, localhost.$mydomain, $mydomain
    . . .

Save and close the file.


    sudo systemctl restart postfix
    
## Step 3 — Testing the SMTP Server

    echo "This is the body of the email" | mail -s "This is the subject line" matinict@gmail.com
    
     postconf -p | grep comp
 
  

## Step 4 — Forwarding System Mail 

    sudo nano /etc/aliases  
    
    /etc/aliases
    
    #See man 5 aliases for format
    
    postmaster:    root
 
With that setting, system generated emails are sent to the root user. What you want to do is edit it so that those emails are rerouted to your email address. To accomplish that, edit the file so that it reads:

    /etc/aliases
    # See man 5 aliases for format
    postmaster:    root
    root:          your_email_address    
    #Replace your_email_address with your personal email address.     
    sudo newaliases
 
You may now test that it works by sending an email to the root account using:

    echo "This is the body of the email" | mail -s "This is the subject line" root
 
You should receive the email at your email address. If not, check your spam folder.


echo "This is the body of the email" | mail -s "This is the subject line" matinict@gmail.com

## Step 5 Recheck

     postconf -p | grep comp



## Ref


https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-postfix-as-a-send-only-smtp-server-on-ubuntu-16-04

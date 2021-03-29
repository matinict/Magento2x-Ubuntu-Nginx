
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
In this step, you’ll test whether Postfix can send emails to an external email account using the mail command, which is part of the mailutils package that was installed in Step 1.To send a test email, type:

    echo "This is the body of the email" | mail -s "This is the subject line" matinict@gmail.com
 
In performing your own test(s), you may use the body and subject line text as-is, or change them to your liking. However, in place of your_email_address, use a valid email address. The domain part can be gmail.com, fastmail.com, yahoo.com, or any other email service provider that you use.Now check the email address where you sent the test message. You should see the message in your inbox. If not, check your spam folder.
Note that with this configuration, the address in the From field for the test emails you send will be sammy@example.com, where sammy is your Linux username and the domain part is the server’s hostname. If you change your username, the From address will also change.

## Step 4 — Forwarding System Mail
The last thing we want to set up is forwarding, so you’ll get emails sent to root on the system at your personal, external email address.To configure Postfix so that system-generated emails will be sent to your email address, you need to edit the /etc/aliases file.

    sudo nano /etc/aliases
 
The full contents of the file on a default installation of Ubuntu 16.04 are as follows:

/etc/aliases
# See man 5 aliases for format
    postmaster:    root
 
With that setting, system generated emails are sent to the root user. What you want to do is edit it so that those emails are rerouted to your email address. To accomplish that, edit the file so that it reads:

    /etc/aliases
# See man 5 aliases for format
    postmaster:    root
    root:          your_email_address
Replace your_email_address with your personal email address. When finished, save and close the file. For the change to take effect, run the following command:

    sudo newaliases
 
You may now test that it works by sending an email to the root account using:

    echo "This is the body of the email" | mail -s "This is the subject line" root
 
You should receive the email at your email address. If not, check your spam folder.








## Ref


https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-postfix-as-a-send-only-smtp-server-on-ubuntu-16-04

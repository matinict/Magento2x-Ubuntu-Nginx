

## SSH Key


### RSA SSH keys

If you use RSA keys for SSH, the US National Institute of Standards and Technology recommends
that you use a key size of at least 2048 bits.
By default, the ssh-keygen command creates an 1024-bit RSA key.
You can create and configure an RSA key with the following command, substituting if desired for the minimum recommended key size of 2048:

      ssh-keygen -t rsa -b 2048 -C "email@example.com"
      ssh-keygen -t rsa -b 2048 -C "matinict@gmail.com"
      ssh-keygen -t rsa -b 4096 -C "matin@eongroup.com.bd"
      
The -C flag, with a quoted comment such as an email address, is an optional way to label your SSH keys.
You'll see a response similar to:
Generating public/private rsa key pair.
Enter file in which to save the key (/home/user/.ssh/id_rsa):

 


 # blackarch
 


    #Full System Update
    sudo pacman -Syu
    sudo pacman -Syu --overwrite '*' --noconfirm --needed
    sudo pacman -Syu --overwrite='*' --noconfirm --needed --ignore=postfix
    sudo pacman -Syu --overwrite='*' --noconfirm --needed --ignore=postfix --disable-download-timeout
    sudo pacman -Syu --noconfirm --needed --disable-download-timeout



    ##Clear Package Cache (If Issues Persist)
    sudo pacman -Scc --noconfirm

      #Temporarily Disable Slow Mirrors and Continue Update
      sudo pacman -Syu --disable-download-timeout
      sudo pacman -Syu --disable-download-timeout --noconfirm
      sudo pacman -Syu --ignore=postfix --noconfirm --needed

      sudo pacman -Syu --overwrite '*',postfix ,veil --noconfirm --needed

      #skip the veil package and continue with other updates.
      sudo pacman -Syu --ignore veil
      sudo pacman -Syu --ignore=postfix,veil

      sudo reflector --latest 20 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
        sudo pacman -Syy



        # Update Packages in Batches of 100
        sudo pacman -Syu --overwrite='*' --noconfirm --needed $(pacman -Qq | head -n 100)
        sudo pacman -Syu --overwrite='*' --noconfirm --needed $(pacman -Qq | tail -n +101 | head -n 100)
        sudo pacman -Syu --overwrite='*' --noconfirm --needed $(pacman -Qq | tail -n +2 | head -n 1)

        #Use a Loop
        for i in $(seq 0 100 $(pacman -Qq | wc -l)); do
        sudo pacman -Syu --overwrite='*' --noconfirm --needed $(pacman -Qq | tail -n +$((i+1)) | head -n 100)
        done
        ## Create Bash
        sudo nano batch_update.sh
          #!/bin/bash

          # Update package database first
          sudo pacman -Syy

          # Get the full package list
          pkg_list=$(pacman -Qq)
          total_pkgs=$(echo "$pkg_list" | wc -l)

          # Loop through packages in batches of 100
          for i in $(seq 0 100 $total_pkgs); do
              batch=$(echo "$pkg_list" | sed -n "$((i+1)),$((i+100))p")
              if [[ -n "$batch" ]]; then
                  sudo pacman -Syu --overwrite='*' --noconfirm --needed $batch
              fi
          done


          chmod +x batch_update.sh
          sudo ./batch_update.sh

          Total Download Size:    5110.96 MiB
          Total Installed Size:  49006.01 MiB
          Net Upgrade Size:       6083.15 MiB

          total 4918
          total 4635 4609 4275



        #Removes orphaned packages no longer required.
        sudo pacman -Qdtq | sudo pacman -Rns -
        #refresh the package databases:
        sudo pacman -Syy
        sudo pacman -Syu
        #Force Download Without Timeout
        sudo pacman -Syu --overwrite '*' --disable-download-timeout


        sudo shutdown now
        sudo poweroff
        poweroff








## LEMP
sudo pacman -S nginx --noconfirm
sudo pacman -S nginx --noconfirm --overwrite='*'
sudo systemctl enable nginx
sudo systemctl start nginx
sudo systemctl status nginx
http://localhost

curl http://localhost

sudo ufw allow 'Nginx Full'
sudo systemctl restart nginx
sudo systemctl reload nginx

sudo nano /etc/nginx/nginx.conf
error_log /var/log/nginx/error.log;
sudo mkdir -p /var/log/nginx
sudo touch /var/log/nginx/error.log
sudo chmod 640 /var/log/nginx/error.log
sudo chown nginx:adm /var/log/nginx/error.log
ps aux | grep nginx

#Web Root Directory
sudo mkdir -p /usr/share/nginx/html
sudo chown -R nginx:nginx /usr/share/nginx/html
sudo chmod -R 755 /usr/share/nginx/html
#/usr/share/nginx/html vs /var/www/html
# Change the Web Root Directory
sudo mkdir -p /var/www/html
sudo chown -R nginx:nginx /var/www/html
sudo chmod -R 755 /var/www/html

sudo nano /etc/nginx/nginx.conf
    root /var/www/html;
sudo systemctl reload nginx

##php
sudo pacman -S php php-fpm
sudo pacman -S php php-fpm --noconfirm --overwrite='*'
sudo pacman -S php-intl php-soap php-gd --noconfirm --overwrite='*'

sudo pacman -S php php-fpm php-cli php-common php-mbstring php-xml php-curl php-opcache php-intl php-mysqli php-zip --noconfirm --overwrite='*'


sudo pacman -S php-gd php-mysql php-xml php-curl
sudo systemctl start php-fpm
sudo systemctl enable php-fpm




#VS code
yay -S visual-studio-code-bin
paru -S visual-studio-code-bin
code --no-sandbox --user-data-dir=/tmp/vscode-data

##snapd
sudo pacman -S snapd --noconfirm --overwrite='*'
sudo systemctl enable --now snapd.socket
sudo snap install --classic code
code
sudo snap refresh code


## DESKTOP Guide
echo $XDG_CURRENT_DESKTOP
sudo pacman -Q | grep -E 'xfce4|kde|gnome|lxde|i3|openbox'
#Light
sudo pacman -S xfce4 xfce4-goodies lightdm lightdm-gtk-greeter --noconfirm --overwrite='*'
sudo pacman -S gst-plugins-base-libs --overwrite '*'
sudo pacman -S gst-plugins-bad-libs gst-plugins-base --noconfirm  --overwrite '*'
sudo systemctl enable lightdm
sudo systemctl start lightdm

#Havey
sudo pacman -S plasma-meta kde-applications sddm
sudo systemctl enable sddm
sudo systemctl start sddm
#gdm
sudo pacman -S gnome gnome-extra gdm
sudo systemctl enable gdm
sudo systemctl start gdm







    #keys
    pacman-key --init
    pacman-key --populate archlinux blackarch
    pacman-key --refresh-keys

    ## If --refresh-keys fails, try this:
    pacman-key --recv-keys --keyserver keyserver.ubuntu.com 4E2C6E8793298290
    pacman-key --lsign-key 4E2C6E8793298290


    #Check for Broken Dependencies
    sudo pacman -Qk
    sudo pacman -Qdt
    sudo pacman -Rns $(pacman -Qdtq)


    ##Verify System Integrity
    sudo pacman -Qkk



    reboot


    #Enable networking:
    systemctl enable dhcpcd
    systemctl enable NetworkManager
    # Restart Networking Services
    systemctl restart NetworkManager
    ping -c 4 google.com
    ping -c 4 8.8.8.8

============================
  # Booting into BlackArch Live ISO


  blackarch-install
  #check the available disks and partitions:
  lsblk
  df -h /
  #cfdisk /dev/sda
  sudo mkfs.fat -F32 /dev/sda1   # EFI Partition 1GB
  sudo mkfs.ext4 /dev/sda2       # Root Partition 60Gb
  sudo mkfs.ext4 /dev/sda3       # Home Partition 50GB


sudo lsblk -f /dev/sda2
sudo e2fsck -f /dev/sda2

sudo e2fsck -f /dev/sda2
sudo resize2fs /dev/sda2
df -h /

sudo blkid
sudo dumpe2fs /dev/sda2 | grep -i "block count"
sudo blockdev --getsize64 /dev/sda2


=================================================


    # Remove Conflicting Packages Manually
    sudo pacman -Rdd ffmpeg
    sudo pacman -S ffmpeg rav1e
    sudo pacman -Rdd aflplusplus
    sudo pacman -Rdd afl++

    ## F*** jre
    pacman -Q | grep jre

    sudo pacman -Rdd jre*

    sudo pacman -Rdd jre-openjdk-headless --noconfirm
    sudo pacman -Rdd jre-openjdk --noconfirm
    sudo pacman -Rdd jre11-openjdk-headless  --noconfirm
    sudo pacman -Rdd jre11-openjdk  --noconfirm
    sudo pacman -Rdd jre17-openjdk  --noconfirm
    sudo pacman -Rdd jdk11-openjdk -noconfirm
    sudo pacman -Rdd jre11-openjdk -noconfirm
    sudo pacman -Rdd jre11-openjdk-headless -noconfirm


    # jdk
    sudo pacman -Rdd jdk*
    sudo pacman -Rdd jdk-openjdk  --noconfirm
    sudo pacman -Rdd jdk11-openjdk  --noconfirm
    sudo pacman -Rdd jdk17-openjdk  --noconfirm
    sudo pacman -Rdd jdk17-openjdk  --noconfirm
    sudo pacman -Rdd jdk11-openjdk -noconfirm


    # python
    pacman -Q | grep python
    sudo pacman -Rdd python*
    sudo pacman -Rdd python-keras-preprocessing  --noconfirm
    sudo pacman -Rdd python-keras  --noconfirm
    sudo pacman -Rdd python-gast  --noconfirm
    sudo pacman -Rdd python-gast03  --noconfirm
    sudo pacman -Rdd python-uvicorn python-typing_extensions  --noconfirm


  ##Reinstall the Correct Package
  sudo pacman -S afl++

  sudo pacman -S jre-openjdk
  sudo pacman -S jdk-openjdk --noconfirm
  sudo pacman -S 'python-typing-extensions --noconfirm




  =====================


  sudo pacman -Rdd plasma-framework appstream-qt python-uvicorn python-typing-extensions
  sudo pacman -Rdd plasma-framework appstream-qt






=============================================================================
=============================================================================

https://blackarch.org/tools.html
=============================================================================
=============================================================================

 

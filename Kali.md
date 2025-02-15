#Kali Linux version

    cat /etc/os-release
    lsb_release -a
    hostnamectl
    cat /etc/issue


# Add an Alias in Kali Linux    

    #nano  ~/.bashrc
    #source ~/.bashrc
    nano ~/.zshrc
    source ~/.zshrc

    alias html="cd /var/www/html"
    alias shopify="cd /var/www/html/shopify"
    alias cl="clear"
    alias u="sudo apt update"
    alias u1="sudo apt update -y"
    alias u2="sudo apt full-upgrade -y"
    alias u3="sudo apt update && sudo apt upgrade -y"
    alias u4="sudo apt autoremove -y"
    alias u5="apt list --upgradable -y"
    alias h="history"
    alias cu="composer update"
    alias cui="composer update --ignore-platform-reqs"
    #Git
    alias gb="git branch"
    #php
    alias pvs="sudo update-alternatives --config php"



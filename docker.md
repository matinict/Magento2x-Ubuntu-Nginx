# Docker

## Install 
    sudo apt-get update
    sudo apt-get install -y docker.io
    sudo systemctl start docker
    sudo systemctl enable docker
    docker --version
    sudo systemctl status docker
    sudo usermod -aG docker $USER
    newgrp docker
    docker run hello-world



## Remove/Clean
    sudo systemctl stop docker
    sudo apt-get remove --purge -y docker docker-engine docker.io containerd runc
    sudo rm -rf /var/lib/docker
    sudo rm -rf /etc/docker
    sudo rm -rf /var/run/docker.sock
    ps aux | grep -i docker
    #matin     679020  0.0  0.0   9580  2560 pts/0    S+   12:00   0:00 grep --color=auto -i docker
    sudo apt-get autoremove -y
    sudo apt-get autoclean

    dpkg -l | grep -i docker
    dpkg -l | grep -E 'docker|containerd|runc'
    which docker
    which dockerd
    
    sudo systemctl list-units --type=service | grep -i docker
    ls -la /var/lib/docker
    ls -la /etc/docker
    ls -la /var/run/docker.sock
    sudo rm -rf /var/lib/docker
    sudo rm -rf /etc/docker
    sudo rm -rf /var/run/docker.sock














=====

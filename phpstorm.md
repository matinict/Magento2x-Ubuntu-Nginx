# Run PhpStorm:
cd  /home/matin/opt/PhpStorm-2021.1/bin
./phpstorm.sh



#Reset trial:
      
      ## Way-1: Reset Expiration 1 month  Evaluation Enjoy again 1 month 
      
            rm -rf ~/.config/JetBrains/PhpStorm2020.1/
            
            rm -rf ~/.config/JetBrains/PhpStorm2020.1
            
            rm -rf ~/.config/JetBrains/PhpStorm2020*
            rm -rf .java/.userPrefs/
            
            rm -rf ~/.config/JetBrains/PhpStorm2020.1/eval/
            
      ## Way-2: /etc/hosts.
      
            1.2.3.4         account.jetbrains.com
            0.0.0.0 https://account.jetbrains.com:443
      
      #Way-3
      
      shopt -s nocaseglob;
      rm -rf ~/.config/JetBrains/phpstorm*/eval;
      rm -rf ~/.config/JetBrains/phpstorm*/options/other.xml;
      rm -rf ~/.java/.userPrefs/jetbrains;
      
      
## Remove PhpStorm

            ##Syntax
            ~/.config/JetBrains/<product><version>

            ~/.cache/JetBrains/<product><version>

            ~/.local/share/JetBrains/<product><version>

            ##Example
            rm -rf ~/.config/JetBrains/PhpStorm2021.3
            rm -rf ~/.cache/JetBrains/PhpStorm2021.3
            rm -rf ~/.local/share/JetBrains/PhpStorm2021.3


            sudo snap remove phpstorm




            rm -r ~/.PhpStorm2020.3
            sudo rm /usr/local/bin/pstorm
            whereis pstorm
            find ./ -name phpstorm.sh





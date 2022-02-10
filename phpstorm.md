
## Way-1: Reset Expiration 1 month  Evaluation Enjoy again 1 month 

      rm -rf ~/.config/JetBrains/PhpStorm2020.3/
      
      rm -rf ~/.config/JetBrains/PhpStorm2021.1
      
      rm -rf ~/.config/JetBrains/PhpStorm202*
      rm -rf .java/.userPrefs/
      
## Way-2: /etc/hosts.

      1.2.3.4         account.jetbrains.com
      0.0.0.0 https://account.jetbrains.com:443
      
      
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





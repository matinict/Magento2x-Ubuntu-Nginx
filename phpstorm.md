
## Way-1: Reset Expiration 1 month  Evaluation

      rm ~/.config/JetBrains/PhpStorm2020.3/options/other.xml
      rm -rf ~/.config/JetBrains/PhpStorm2020.3/eval/*
      rm -rf .java/.userPrefs
      
## Way-2: /etc/hosts.

      1.2.3.4         account.jetbrains.com
      0.0.0.0 https://account.jetbrains.com:443

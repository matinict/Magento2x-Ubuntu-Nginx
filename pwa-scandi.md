
# ScandiPWA

## The Requirements 
 To  check that all prerequisites are met neet installed:

- [Magento](m24.md)

- [Redis](redis.md)

- [Node](node.md)

- [Varshish](varnish.md)


### Check Magento var 
   
    ##Terminal
    php bin/magento --version

    ##sowagar
    url/sowagar

    ##url
    https://www.magereport.com/scan


  

### Check Redis cache 

   ##Redis ping : 
   redis-cli ping 

   ##Redis monitor: 
   redis-cli monitor
 
 
 
 ### Check Varshish cache 
    
    varnishncsa 
    varnishlog
    varnishd -V
    varnishhist
 
 
 ### Check Node  
 
   node -v
   ##Output v16.6.1

 
 
 

## Ref:

https://docs.scandipwa.com

https://github.com/scandipwa/scandipwa

https://docs.scandipwa.com/scandipwa-and-magento/magento-integration

https://www.youtube.com/watch?v=JfvC3PcaHPU

https://www.youtube.com/watch?v=xGwvfIAyVrM

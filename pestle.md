

## Pestle


    ##The easiest way to get started is to grab the latest build using curl
    curl -LO http://pestle.pulsestorm.net/pestle.phar
    
    ##You can see a list of commands with the following
    php pestle.phar list-commands
    
    ## get help for a specific command with
    php pestle.phar help generate_module
    
    ## Create Module
    php pestle.phar generate_module Spidertech WordPress 1.0.0
    
    ## Genarate Modul 
    php pestle.phar generate_module
    
    ## Genarate Route 
    php pestle.phar generate_route Spidertech WordPress 1.0.0
    
    ## Adding View
    php pestle.phar generate_view Pulsestorm_HelloPestle frontend hello_pestle_index_index Main content.phtml
    php pestle.phar generate_view
    
    ## Full Module
    php pestle.phar magento2:generate:full-module Spidertech BundleLanding 1.0.0 
        
        #!/bin/bash
        pestle.phar magento2:generate:module Spidertech BundleLanding 0.0.1
        
        ##pestle.phar magento2:generate:crud-model Spidertech_BundleLanding 1.0.0
        php pestle.phar magento2:generate:crud-model Spidertech_BundleLanding Bundle Product
        
        pestle.phar magento2:generate:acl Spidertech_BundleLanding Spidertech_BundleLanding::1.0.0s
        pestle.phar magento2:generate:menu Spidertech_BundleLanding "" Spidertech_BundleLanding::1.0.0s Spidertech_BundleLanding::1.0.0s "BundleLanding 1.0.0s" spidertech_bundlelanding_1.0.0s/index/index 10
        pestle.phar magento2:generate:menu Spidertech_BundleLanding Spidertech_BundleLanding::1.0.0s Spidertech_BundleLanding::1.0.0s_list Spidertech_BundleLanding::1.0.0s "1.0.0 Objects" spidertech_bundlelanding_1.0.0s/index/index 10
        pestle.phar magento2:generate:route Spidertech_BundleLanding adminhtml spidertech_bundlelanding_1.0.0s Index Index
        pestle.phar magento2:generate:view Spidertech_BundleLanding adminhtml spidertech_bundlelanding_1.0.0s_index_index Main content.phtml 1column
        pestle.phar magento2:generate:ui:grid Spidertech_BundleLanding spidertech_bundlelanding_1.0.0s 'Spidertech\BundleLanding\Model\ResourceModel\1.0.0\Collection' 1.0.0_id
        pestle.phar magento2:generate:ui:add-column-text app/code/Spidertech/BundleLanding/view/adminhtml/ui_component/spidertech_bundlelanding_1.0.0s.xml title "Title"
        pestle.phar magento2:generate:ui:form Spidertech_BundleLanding 'Spidertech\BundleLanding\Model\1.0.0' Spidertech_BundleLanding::1.0.0s
        pestle.phar magento2:generate:ui:add_to_layout app/code/Spidertech/BundleLanding/view/adminhtml/layout/spidertech_bundlelanding_1.0.0s_index_index.xml content spidertech_bundlelanding_1.0.0s
        pestle.phar magento2:generate:acl:change_title app/code/Spidertech/BundleLanding/etc/acl.xml Spidertech_BundleLanding::1.0.0s "Manage 1.0.0s"
        pestle.phar magento2:generate:controller_edit_acl app/code/Spidertech/BundleLanding/Controller/Adminhtml/Index/Index.php Spidertech_BundleLanding::1.0.0s
        pestle.phar magento2:generate:remove-named-node app/code/Spidertech/BundleLanding/view/adminhtml/layout/spidertech_bundlelanding_1.0.0s_index_index.xml block spidertech_bundlelanding_block_main

        php bin/magento module:enable Spidertech_BundleLanding


    ## All
    pestle.phar list
    
    ## Generates Theme Configuration
    php pestle.phar magento2:generate:theme Spidertech_Theme 1.0.0    
    php pestle.phar magento2:generate:theme Spidertech_Theme 1.0.0  frontend 






## Ref

    https://github.com/astorm/pestle
    https://alanstorm.com/category/magento-2/

#!/bin/bash
rm -rf generated/metadata/*
php  bin/magento maintenance:enable
rm -rf var/page_cache/*
rm -rf var/cache/*
rm -rf var/view_preprocessed/*
rm -rf generated/code/*
rm -rf pub/static/adminhtml/
rm -rf pub/static/frontend/
php  bin/magento setup:upgrade
php  bin/magento ca:fl
php  bin/magento setup:di:compile
php  bin/magento setup:static-content:deploy en_US -f
php  bin/magento maintenance:disable

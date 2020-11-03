#!/bin/bash

domainName="domain.region"

read -p "Are you sure, you want to renew $domainName cert? [y/n]: " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    service nginx stop
    service php7.0-fpm stop
    certbot certonly --standalone --preferred-challenges http -d $domainName
    service nginx start
    service php7.0-fpm start
fi

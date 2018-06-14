#!/bin/sh

if [ ! -f ./backup/hosts.org ] 
then
    echo "There is no hosts.org !!!"
    exit 1
fi


sudo cp ./backup/hosts.org /etc/hosts
sudo dscacheutil -flushcache

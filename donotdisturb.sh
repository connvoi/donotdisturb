#!/bin/sh
NEWHOSTS=./hosts.new

#remove hosts.new
if [ -f $NEWHOSTS ] 
then
    rm $NEWHOSTS
fi

## create backup file
if [ ! -f ./backup/hosts.org ] 
then
    sudo cp /etc/hosts ./backup/hosts.org   
fi


## copy from orignal hosts
while read x; do
    echo $x
    echo $x >> $NEWHOSTS
done < ./backup/hosts.org


for i in `ls ./conf/`
do
    echo "add $i"
    while read x; do
        echo $x
        echo $x >> ./hosts.new
    done < ./conf/$i
done

sudo cp $NEWHOSTS /etc/hosts
sudo dscacheutil -flushcache

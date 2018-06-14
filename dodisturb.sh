#!/bin/sh
NEWHOSTS=./hosts.new

#remove hosts.new
if [ -f $NEWHOSTS ] 
then
    rm $NEWHOSTS
fi

if [ ! -f ./backup/hosts.org ] 
then
    echo "There is no hosts.org !!!"
    exit 1
fi

## copy from orignal hosts
while read x; do
    echo $x
    echo $x >> $NEWHOSTS
done < ./backup/hosts.org


for i in `ls ./conf/*.allow`
do
    echo "add $i"
    while read x; do
        echo $x
        echo $x >> ./hosts.new
    done < $i
done

sudo cp $NEWHOSTS /etc/hosts
sudo dscacheutil -flushcache

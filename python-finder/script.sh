#!/usr/bin/env bash

echo "Getting sources..."
apt-rdepends -r --follow=Obsoletes python3:any | grep 'Reverse Depends:' | cut -d' ' -f5 | sort -u | head -n 10 | while read i
do
    echo -n "$i: "
    rm -rf $i
    mkdir $i
    cd $i
    apt source $i &>/dev/null
    DSCFILE=$(ls *.dsc)

    if [[ `ls ../*/$DSCFILE | wc -l` -gt 1 ]]; then
        echo "duplicate"
        cd ..
        rm -rf $i
    else
        echo 'OK'
        cd ..
    fi
done

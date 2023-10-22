#!/bin/bash
# Script by Aristech ( aris@progressnet.gr )
# http://progressnet.gr
#
# I am not responsible for any damage that may occur when running this script.

LIST=infectedfiles.txt
PATTERN="eval(base64_decode"
TARGET="/home/youruser"

if [ ! -s $LIST ] ; then
grep -l -R --include=*.php $PATTERN $TARGET > $LIST
fi

for INPUT in `cat $LIST`
do
echo FIX $INPUT ...
TEMP=$INPUT.tmp
OLD=$INPUT.bad
< $INPUT sed "s/<?php/\n<?php/g" | grep -v $PATT > $TEMP
mv $INPUT $OLD
mv $TEMP $INPUT
done
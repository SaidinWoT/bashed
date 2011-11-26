#! /bin/bash
tmp=`mktemp .tmp.XXX`
find ./ -iname "*foo.*" > $tmp
while read line
do
    mv "$line" "`echo "$line" | sed s/foo/bar/`"
done < $tmp
rm $tmp

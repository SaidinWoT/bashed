#! /bin/bash
tmp=`mktemp .tmp.XXX`
curl -s http://shirt.woot.com/Blog/Feed.ashx | grep 'href=.http://sale' | sed "s:.*href=.\(.*Detail.png\).*:\1:" > $tmp
num=0
while read line
do
	let "num += 1"
	wget -q $line -O .shirt${num}.png;
done < $tmp
feh -D 3 .shirt[1-${num}].png
rm .shirt[1-${num}].png $tmp

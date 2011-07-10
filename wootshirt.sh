#! /bin/bash
curl -s http://shirt.woot.com/Blog/Feed.ashx | grep 'href=.http://sale' | sed "s:.*href=.\(.*Detail.png\).*:\1:" > .var.temp
day=0
while read line
do
	wget -q $line -O ~/.shirt${day}.png;
	let "day += 1"
done < .var.temp
feh -D 3 .shirt[0-6].png
rm .shirt[0-6].png .var.temp

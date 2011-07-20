#! /bin/bash
curl -s http://shirt.woot.com/Blog/Feed.ashx | grep 'href=.http://sale' | sed "s:.*href=.\(.*Detail.png\).*:\1:" > .var.temp
day=0
while read line
do
	let "day += 1"
	wget -q $line -O .shirt${day}.png;
done < .var.temp
feh -D 3 .shirt[1-${day}].png
rm .shirt[1-${day}].png .var.temp

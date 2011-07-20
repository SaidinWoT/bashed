#! /bin/bash
curl -s http://shirt.woot.com/Derby/Default.aspx?sort=votes | grep "Tier2EntryRepeater_ctl00_._StatusOverlayDiv" | sed "s:.*39;\(.*\)&.*:\1:" > .var.temp
num=0
while read line
do
	let "num += 1"
	wget -q `curl -s $line | grep "lazysrc" | sed "s:.*\(http.*jpg\).*:\1:"` -O .pic${num}.jpg
done < .var.temp
feh -D 3 .pic[1-${num}].jpg
rm .pic[1-${num}].jpg .var.temp

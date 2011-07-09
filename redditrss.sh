#! /bin/bash
curl -s http://www.reddit.com/.rss | sed "s:</title>:\\`echo -e '\n\r'`:g" | grep -m 3 -o '<item><title>.*' | sed "s:<item><title>::"

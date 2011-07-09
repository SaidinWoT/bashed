#! /bin/bash
curl -s http://www.reddit.com | sed -e "1 d" -e "s:^.*>here</a>::g" -e "s:'\(>.*\);\(.*</a>\)':\1\2:g" -e "s:;:\\`echo -e '\n\r'`:g" | grep -m -3 '</a>&#32' | sed "s:.*>\(.*\)</a>&#32:\1:"

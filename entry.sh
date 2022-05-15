#!/bin/sh

export TODAY=$(date +%Y/%m/%d)
/app/shell2http -export-all-vars -port=$PORT -cache=3600 /nyt 'convert -density 300 https://static01.nyt.com/images/$TODAY/nytfrontpage/scan.pdf -trim +repage -resize "1364x1832^" -crop 1364x1832 -gravity center -extent 1404x1872 jpeg:-'

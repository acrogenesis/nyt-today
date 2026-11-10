#!/bin/sh
# Render today's New York Times front page as a reMarkable-sized JPEG on stdout.
set -eu

today=$(TZ=America/Chicago date +%Y/%m/%d)

curl -fsSL "https://static01.nyt.com/images/$today/nytfrontpage/scan.pdf" |
  magick -density 300 pdf:- -trim +repage -resize "1364x1832^" -crop 1364x1832 -gravity center -extent 1404x1872 jpeg:-

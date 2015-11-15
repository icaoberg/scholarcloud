#!/bin/bash

URL='http://www.gutenberg.org/cache/epub/2009/pg2009.txt'
wget -nc $URL

tr '[:upper:]' '[:lower:]' < pg2009.txt > words.txt
rm -fv pg2009.txt

python origin_of_the_species.py

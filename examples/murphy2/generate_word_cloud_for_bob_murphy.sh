#!/bin/bash

for I in {1..500}
do
	URL='https://scholar.google.com/citations?user=qQLlBH4AAAAJ&hl=en&oi=ao&cstart='
	wget -nc --output-document "$I.html" $URL$I
	cat $I.html | tr ">" "\n" >> temp.html
	rm -fv $I.html
done

grep 'class="gsc_a_at"' -A1 temp.html | cut -d'"' -f1 | cut -d'=' -f2 | cut -d"<" -f1 | sort  | uniq | xargs echo | tr '[:upper:]' '[:lower:]' > words.txt
rm -fv temp.html

echo "

from os import path
import os
from scipy.misc import imread
import matplotlib.pyplot as plt
import random

import urllib

from wordcloud import WordCloud, STOPWORDS

#change this to your taste
dpi = 3000

#i used wc to count the number of words in little_women.txt
list_of_number_of_words = [25,50,100,250,500,1000]

def grey_color_func(word, font_size, position, orientation, random_state=None, **kwargs):
    return "hsl(0, 0%%, %d%%)" % random.randint(60, 100)

d = os.getcwd()

# little women by louisa may alcott
filename = 'words.txt'
text = open(filename).read()

stopwords = STOPWORDS.copy()

for number_of_words in list_of_number_of_words:
	wordcloud = WordCloud(max_words=number_of_words, stopwords=stopwords, margin=0,
	      	        random_state=1).generate(text)

	filename='words' + str(number_of_words).zfill(6) + '.png'
	image = wordcloud.to_image()
	image.save( filename, "PNG" )
" > script.py

python script.py
rm -fv script.py
rm -fv words.txt

DIRECTORY='images'
if [ ! -d $DIRECTORY ]; then
	mkdir $DIRECTORY
fi

mv -v *.png images

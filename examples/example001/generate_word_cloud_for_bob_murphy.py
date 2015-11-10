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

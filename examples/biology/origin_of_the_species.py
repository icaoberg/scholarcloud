from os import path
import os
from scipy.misc import imread
import matplotlib.pyplot as plt
import random

import urllib

from wordcloud import WordCloud, STOPWORDS

dpi = 3000
number_of_words = 50000

d = os.getcwd()
filename = 'stencils/inverted_cell.png'
mask = imread(path.join(d, filename))

filename = 'words.txt'
text = open(filename).read()

# adding movie script specific stopwords
stopwords = STOPWORDS.copy()

wc = WordCloud(max_words=number_of_words, mask=mask, stopwords=stopwords, margin=0, max_font_size=5,
               random_state=1).generate(text)

# store default colored image
img = wc.to_image()
filename='origin_of_the_species.png'
img.save( filename, 'png' )


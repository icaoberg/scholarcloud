from os import path
import os
from scipy.misc import imread
import matplotlib.pyplot as plt
import random

import urllib

from wordcloud import WordCloud, STOPWORDS

#change this to your taste
dpi = 1000

#i used wc to count the number of words in little_women.txt
number_of_words = 188986

def grey_color_func(word, font_size, position, orientation, random_state=None, **kwargs):
    return "hsl(0, 0%%, %d%%)" % random.randint(60, 100)

d = os.getcwd()
#you can find the original stencil in
#https://openclipart.org/detail/1196/kamma-rahbek-silhouette
filename = 'stencil.png'
mask = imread(path.join(d, filename))

# little women by louisa may alcott
filename = 'little_women.txt'
gutenberg_url = 'http://www.gutenberg.org/cache/epub/514/pg514.txt'
urllib.urlretrieve(gutenberg_url, filename)
text = open(filename).read()

# adding movie script specific stopwords
stopwords = STOPWORDS.copy()

wordcloud = WordCloud(max_words=number_of_words, mask=mask, stopwords=stopwords, margin=0,
               random_state=1).generate(text)

# store default colored image
plt.figure()
plt.axis("off")
plt.imshow( wordcloud )
filename='little_women.png'
plt.savefig(filename, dpi=dpi)

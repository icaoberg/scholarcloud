from urllib import urlretrieve
import textract

from os import path
import os
from scipy.misc import imread
import matplotlib.pyplot as plt
import random

import urllib

from wordcloud import WordCloud, STOPWORDS

string = '''An Analysis of Active Learning With Uniform Feature Noise
Aaditya Ramdas, Barnabas Poczos, Aarti Singh, Larry Wasserman
Comments: 24 pages, 2 figures, published in the proceedings of the 17th International Conference on Artificial Intelligence and Statistics (AISTATS), 2014
Subjects: Machine Learning (stat.ML); Artificial Intelligence (cs.AI); Learning (cs.LG); Statistics Theory (math.ST)
'''

print "Downloading..."
print string
url = 'http://arxiv.org/pdf/1505.04215.pdf'
filename = 'article.pdf'

urlretrieve ( url, filename )

text = textract.process( filename )

#change this to your taste
dpi = 3000

#i used wc to count the number of words in little_women.txt
list_of_number_of_words = [25,50,100,250,500,1000]

def grey_color_func(word, font_size, position, orientation, random_state=None, **kwargs):
    return "hsl(0, 0%%, %d%%)" % random.randint(60, 100)

d = os.getcwd()

stopwords = STOPWORDS.copy()

width=2400
height=2200
colors = ['white', 'black']

for number_of_words in list_of_number_of_words:
    for color in colors:
        print "Making a " + color + " wordcloud with " + str(number_of_words) + " words."
    	wordcloud = WordCloud(background_color=color, max_words=number_of_words, stopwords=stopwords, margin=0,
    	      	        random_state=1, width=width, height=height).generate(text)

    	filename='images/wasserman_' + color + "_" + str(number_of_words).zfill(6) + '.png'
    	image = wordcloud.to_image()
    	image.save( filename, "PNG" )

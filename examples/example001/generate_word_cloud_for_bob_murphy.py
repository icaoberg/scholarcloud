# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

from os import path
import os
from scipy.misc import imread
import matplotlib.pyplot as plt
import random

import urllib

from wordcloud import WordCloud, STOPWORDS

#change this to your taste
dpi = 3000

list_of_number_of_words = [25,50,100,250,500,1000]

def grey_color_func(word, font_size, position, orientation, random_state=None, **kwargs):
    return "hsl(0, 0%%, %d%%)" % random.randint(60, 100)

d = os.getcwd()

#these are the extracted words from bob murphy's article titles
filename = 'words.txt'
text = open(filename).read()

stopwords = STOPWORDS.copy()

width=2400
height=2200
colors = ['white', 'black']

for number_of_words in list_of_number_of_words:
    for color in colors:

        print "Making a " + color + " wordcloud with " + str(number_of_words) + " words."
    	wordcloud = WordCloud(max_words=number_of_words, stopwords=stopwords, margin=0,
    	      	        random_state=1, width=width, height=height,background_color=color).generate(text)

    	filename='murphy_' + color + "_" + str(number_of_words).zfill(6) + '.png'
    	image = wordcloud.to_image()
    	image.save( filename, "PNG" )

from urllib import urlretrieve

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

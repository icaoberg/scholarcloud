# scholarcloud

[![Build Status](https://travis-ci.org/icaoberg/scholarcloud.svg)](https://travis-ci.org/icaoberg/scholarcloud)

Simple script that generates a wordcloud from different scholarly resources.

This code is super-alpha. I am still testing other python packages that can I
piece together so that I do not have reinvent the wheel. If everything works as planned, scholarcloud will be nothing but
wrapper around existing tools.

## List of Examples using Existing Tools
### example001: ```bash```+```python```
This example scrapes all the pages in Google Scholar that are related to Robert F.
Murphy. Since there is no official Google Scholar API, this is rather hacky. But it does the job.

![Wordcloud generated using example001](examples/example001/images/words001000.png)

### example002: ```bash```+```python```
This example downloads PDF files hosted in the Murphy Lab website (```found in links.out```)
and extracts the text to generate the wordclouds. This is rather hacky as well. But it does the job.

![Wordcloud generated using example002](examples/example002/images/words001000.png)

### example003:```bash```
This example attempts to scrape the Google Scholar page associated with Carnegie Mellon University to extract the list of scientists registered in the site along with the Google Scholar ID.

### example004: ```python```
This example attempts to extract the text from

```
An Analysis of Active Learning With Uniform Feature Noise
Aaditya Ramdas, Barnabas Poczos, Aarti Singh, Larry Wasserman
Comments: 24 pages, 2 figures, published in the proceedings of the 17th International Conference on Artificial Intelligence and Statistics (AISTATS), 2014
Subjects: Machine Learning (stat.ML); Artificial Intelligence (cs.AI); Learning (cs.LG); Statistics Theory (math.ST)
```

within Python. At this point I am not happy with the results.

![Wordcloud generated using example004](examples/example004/images/words001000.png)

### example005: ```python```
This example extracts a book from the Gutenberg project and then constructs a wordcloud using a stencil in Python. Somewhat happy. We could use a synthetic cell to generate a word cloud for the lab? Or some raw data?

![Wordcloud generated using example005](examples/example005/little_women.png)

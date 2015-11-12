# scholarcloud
Simple script that generates a wordcloud from different scholar resources.

This code is super-alpha. I am still testing other python so that I do not have
reinvent the wheel. If everything works as planed, scholarcloud will be nothing but
wrapper around existing tools.

## List of Examples
### example001
This example scrapes all the pages in Google Scholar that are related to Robert F.
Murphy. Since there is no official Google Scholar API, this is rather hacky. But it does the job.

![Wordcloud generated using example001](examples/example001/images/words001000.png)

### example002
This downloads PDFS files hosted in the Murphy Lab website and extracts the text
to be used to generate the wordclouds. This is rather hacky as well. But it does the job.

![Wordcloud generated using example002](examples/example002/images/words001000.png)

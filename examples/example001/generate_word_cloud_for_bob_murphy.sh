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

python generate_word_cloud_for_bob_murphy.py
rm -fv words.txt

DIRECTORY='images'
if [ ! -d $DIRECTORY ]; then
	mkdir $DIRECTORY
fi

mv -v *.png images

#!/bin/bash

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

WORDS='words_'`11-11-2015`'.txt'
if [ ! -f words.txt ]; then
	for I in {1..500}
	do
		URL='https://scholar.google.com/citations?user=qQLlBH4AAAAJ&hl=en&oi=ao&cstart='
		wget -nc --output-document "$I.html" $URL$I
		cat $I.html | tr ">" "\n" >> temp.html
		rm -fv $I.html
	done
fi

grep 'class="gsc_a_at"' -A1 temp.html | cut -d'"' -f1 | cut -d'=' -f2 | cut -d"<" -f1 | sort  | uniq | xargs echo | tr '[:upper:]' '[:lower:]' > words.txt

if [ -f temp.html ]; then
	rm -fv temp.html
fi

python generate_word_cloud_for_bob_murphy.py

if [ -f words.txt ]; then
	wc -w words.txt
fi

#images
DIRECTORY='images'
if [ ! -d $DIRECTORY ]; then
	mkdir $DIRECTORY
fi

COUNT=`ls -1 *.png 2>/dev/null | wc -l`
if [ $COUNT != 0 ]
then
	mv -v *.png $DIRECTORY
fi

#words
DIRECTORY='words'
if [ ! -d $DIRECTORY ]; then
	mkdir $DIRECTORY
fi

COUNT=`ls -1 *.txt 2>/dev/null | wc -l`
if [ $COUNT != 0 ]
then
	mv *.txt $DIRECTORY
fi

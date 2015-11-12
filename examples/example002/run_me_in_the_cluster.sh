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

#$ -j y
#$ -S /bin/bash
#$ -cwd
#PBS -q pool3-bigmem

cd $PBS_O_WORKDIR

source ../../bin/activate

if [ -z `which pdftotext` ]; then
  echo "pdftotext is not installed. Install first and then try again."
  exit
fi

WORDS='words_'`date +"%m-%d-%Y"`'.txt'

for FILE in $(cat links.out)
do
        echo "Downloading article "$FILE
        wget --quiet -nc "$FILE"
done

for FILE in *.pdf
do
        echo "Extracting text from "$FILE
        pdftotext "$FILE"
        rm -f "$FILE"
done

echo "Concatenating text files"
for FILE in *.txt
do
        if [ ! -f links.txt ]; then
                echo "Concatenating "$FILE
                cat "$FILE" >> words.txt
                rm -fv "$FILE"
        fi
done

if [ -f temp.html ]; then
	rm -fv temp.html
fi

echo "Generating word clouds"
python generate_word_cloud_for_bob_murphy.py

if [ -f words.txt ]; then
	wc -w words.txt
fi
mv words.txt $WORDS

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

deactivate

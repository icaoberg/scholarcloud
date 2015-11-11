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

if [ ! $# -eq 2 ]; then
	echo "Oh no! Wrong number of input arguments."
	echo "Script has two input arguments:"
	echo "scientist_name: The name of the scientist. Can be any string."
	echo "scientist_id: The id of the scientist in Google Scholar. For now it must be a perfect match."
	echo ""
	echo "Examples:"
	echo 'bash ./scholar2text.sh "Robert F. Murphy" "qQLlBH4AAAAJ&hl"'
	echo 'bash ./scholar2text.sh "Christopher Langmead" "Dj3gptkAAAAJ"'
	exit
fi

SCIENTIST_NAME=`echo $1 | tr ' ' '_' | tr -d '[{}(),\!]' | tr -d "\'" | tr '[A-Z]' '[a-z]'`
SCIENTIST_ID=$2
WORDS="$SCIENTIST_NAME"_`date +"%m-%d-%Y" --date="today"`.txt

if [ ! -f $WORDS ]; then
	for I in {1..500}
	do
		URL='https://scholar.google.com/citations?user='$SCIENTIST_ID'=en&oi=ao&cstart='
		wget -nc --output-document "$I.html" $URL$I
		cat $I.html | tr ">" "\n" >> temp.html
		rm -fv $I.html
	done
fi

grep 'class="gsc_a_at"' -A1 temp.html | cut -d'"' -f1 | cut -d'=' -f2 | cut -d"<" -f1 | sort  | uniq | xargs echo | tr '[:upper:]' '[:lower:]' > $WORDS
rm -fv temp.html

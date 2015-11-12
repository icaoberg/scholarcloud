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

URL='https://scholar.google.com/citations?view_op=view_org&hl=en&org=17554517495610703090'
wget -nc --output-document 1.html $URL
cat 1.html | tr ">" "\n" >> temp.html
rm -fv 1.html
grep '<h3 class="gsc_1usr_name"' -A2 temp.html | cut -d'"' -f3 | cut -d"<" -f1 | sort | uniq | sed '/^$/d' | sed '/--/d' | sed '/^$/d' >> authors


#if [ ! -f words.txt ]; then
#	for ((I=10; I <= 100; I=I+19))
#	do
#		URL='https://scholar.google.com/citations?view_op=view_org&hl=en&org=17554517495610703090&astart='$I
#		wget -nc --output-document "$I.html" $URL$I
#		cat $I.html | tr ">" "\n" >> temp.html
#		rm -fv $I.html
#	done
#fi

#I=20
#URL='https://scholar.google.com/citations?view_op=view_org&hl=en&org=17554517495610703090&astart='$I
#wget -nc --output-document temp0.html $URL
#cat temp0.html | tr ">" "\n" >> temp.html

#grep '<h3 class="gsc_1usr_name"' -A2 temp.html | cut -d'"' -f3 | cut -d"<" -f1 | sort | uniq | sed '/^$/d' | sed '/--/d' | sed '/^$/d' >> authors

#grep 'class="gsc_a_at"' -A1 temp.html | cut -d'"' -f1 | cut -d'=' -f2 | cut -d"<" -f1 | sort  | uniq | xargs echo | tr '[:upper:]' '[:lower:]' > words.txt
#rm -fv temp.html

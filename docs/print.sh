#!/bin/bash

CODE=docs/code.html

cd ..
echo '<!DOCTYPE html><html><head><meta charset="utf-8">' > $CODE
echo '<style>h2{margin: 5px 0;}</style></head><body>' >> $CODE

echo "<h2>Files</h2>" >> $CODE
echo "<pre>" >> $CODE
paste \
  <(tree -I docs | sed 's/^\./hangman/' | grep -v 'README\|pyc' | head -n -2 |
    awk '{printf "%-28s\n", $0}') \
  <(cloc . --exclude-dir=docs -quiet | tail -n +4 | head -n -3 |
    sed -r 's/([a-zA-Z0-9]) {5}/\1/g' | sed -r 's/ {10}//' | sed -r 's/-{30}//') \
  >> $CODE
echo "</pre>" >> $CODE

echo "<h2>hangman.py</h2>" >> $CODE
pygmentize -f html -O full,linenos=1 hangman.py >> $CODE

echo "<h2>static/main.css</h2>" >> $CODE
pygmentize -f html -O full,linenos=1 static/main.css >> $CODE

echo "<h2>templates/index.html</h2>" >> $CODE
pygmentize -f html -O full,linenos=1 templates/index.html >> $CODE

echo "<h2>templates/home.html</h2>" >> $CODE
pygmentize -f html -O full,linenos=1 templates/home.html >> $CODE

echo "<h2>templates/play.html</h2>" >> $CODE
pygmentize -f html -O full,linenos=1 templates/play.html >> $CODE

echo "<h2>static/main.js</h2>" >> $CODE
pygmentize -f html -O full,linenos=1 static/main.js >> $CODE

echo "<h2>README.md</h2>" >> $CODE
mv README.md README.txt
pygmentize -f html -O full README.txt >> $CODE
mv README.txt README.md

echo "</body></html>" >> $CODE


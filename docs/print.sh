#!/bin/bash

CODE=docs/code.html

cd ..

echo "<h2>Files</h2>" > $CODE
echo "<pre>" >> $CODE
tree -I docs | grep -v 'README\|pyc' >> $CODE
echo "</pre>" >> $CODE

echo "<h2>hangman.py</h2>" >> $CODE
pygmentize -f html -O full,linenos=1 hangman.py >> $CODE

echo "<h2>static/main.css</h2>" >> $CODE
pygmentize -f html -O full,linenos=1 static/main.css >> $CODE

echo "<h2>templates/index.html</h2>" >> $CODE
pygmentize -f html -O full,linenos=1 templates/index.html >> $CODE

echo "<h2>templates/home.html</h2>" >> $CODE
pygmentize -f html -O full,linenos=1 templates/home.html >> $CODE

echo "<h2>templates/game.html</h2>" >> $CODE
pygmentize -f html -O full,linenos=1 templates/game.html >> $CODE

echo "<h2>static/main.js</h2>" >> $CODE
pygmentize -f html -O full,linenos=1 static/main.js >> $CODE

echo "<h2>README.md</h2>" >> $CODE
mv README.md README.txt
pygmentize -f html -O full README.txt >> $CODE
mv README.txt README.md

sed -i 's/pre { line-height: 125%; }/pre { line-height: 125%; font-size: 14px}/g' $CODE

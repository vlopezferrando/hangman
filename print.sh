#!/bin/bash
echo "<h2>hangman.py</h2>" > code.html
pygmentize -f html -O full,linenos=1 hangman.py >> code.html
echo "<h2>static/main.css</h2>" >> code.html
pygmentize -f html -O full,linenos=1 static/main.css >> code.html
echo "<h2>templates/index.html</h2>" >> code.html
pygmentize -f html -O full,linenos=1 templates/index.html >> code.html
echo "<h2>templates/home.html</h2>" >> code.html
pygmentize -f html -O full,linenos=1 templates/home.html >> code.html
echo "<h2>templates/game.html</h2>" >> code.html
pygmentize -f html -O full,linenos=1 templates/game.html >> code.html
#sed -i 's/pre { line-height: 125%; }/pre { line-height: 125%; font-size: 13px}/g' code.html
echo "<h2>static/main.js</h2>" >> code.html
pygmentize -f html -O full,linenos=1 static/main.js >> code.html
echo "<h2>README.md</h2>" >> code.html
pygmentize -f html -O full README.txt >> code.html

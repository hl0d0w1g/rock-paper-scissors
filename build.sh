#!/bin/bash
# Compile Elm files
elm-make ./src/RockPaperScissors/RockPaperScissors.elm --output=./src/script.js --warn
# Locate the repository
LOC='file://'$PWD'/index.html'
# Open in browser
# Check if Google Chrome exists
if ! type 'google-chrome' > /dev/null; then
  	echo 'Google Chrome is not installed, the app can be opened with other browsers by visiting the following url: '$LOC
else
	google-chrome $LOC
fi
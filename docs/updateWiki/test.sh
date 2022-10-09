#!/bin/bash

PATH_FILE='/docs/diagram'
FILES_PUML=$(ls .$PATH_FILE -t -U | grep '^[a-z_]\+\.puml$')

function getAndSaveImg() {
    echo $1
}

for file_name in $FILES_PUML; do
    CONTENT_FILE=$(<".$PATH_FILE/$file_name") # get file
    CONTENT_WITH_THEME=${sed s/^\'include_theme_here$/https://raw.githubusercontent.com/FelipeBuenoNunes/test/main/docs/diagram/puml-theme-sla.puml/ first_diagram.puml}
    HEX_TEXT=$(echo -n "$CONTENT_FILE" | od -A n -t x1) # text to hex
    HEX_TEXT=${HEX_TEXT//[^a-z^0-9]/} #remove spaces
    NEW_FILE_NAME=${file_name//.puml/.svg}
    curl www.plantuml.com/plantuml/svg/~h$HEX_TEXT --output .$PATH_FILE/$NEW_FILE_NAME
done

# get configs git
author=`git log -1 --format="%an"`
email=`git log -1 --format="%ae"`
message=`git log -1 --format="%s"`

# set configs git
git config --global user.email "$email"
git config --global user.name "$author"


git add .
git commit -m "boa"
git push
# for i in $thefile; do
#     name=`expr match "$i" '\([a-z_]*\)'` #
#     name=${name//_/ }
#     name=${name^}
#     echo $name
# done
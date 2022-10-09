#!/bin/bash

PATH_FILE='/docs/diagram'
if [[ $PATH_FILE =~ ^[^.] ]] 
then
    PATH_FILE=".$PATH_FILE"
fi


FILES_PUML=$(ls $PATH_FILE -t -U | grep '^[a-z_]\+\.puml$')

function getAndSaveImg() {
    echo $1
}

for file_name in $FILES_PUML; do
    CONTENT_FILE=$(<"$PATH_FILE/$file_name") # get file

    THEME_LINK="https://raw.githubusercontent.com/FelipeBuenoNunes/test/main/docs/diagram/puml-theme-sla.puml"
    
    #replace ('include_theme_here) for the theme link
    CONTENT_WITH_THEME=$(sed "s,'include_theme_here,!include $THEME_LINK,g" $PATH_FILE/$file_name)
    
    HEX_TEXT=$(echo -n "$CONTENT_WITH_THEME" | od -A n -t x1) # text to hex
    HEX_TEXT=${HEX_TEXT//[^a-z^0-9]/} #remove spaces
    
    NEW_FILE_NAME=${file_name//.puml/.png} 
    
    curl www.plantuml.com/plantuml/png/~h$HEX_TEXT --output $PATH_FILE/$NEW_FILE_NAME
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
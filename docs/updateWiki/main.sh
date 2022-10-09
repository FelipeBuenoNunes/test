#!/bin/bash

PATH_DIAGRAMS="/docs/diagram"
PATH_DIAGRAMS_LOCAL= $(echo $GITHUB_REPOSITORY | grep '/[[:alnum:]\-\.\_]\+$')$PATH_DIAGRAMS
PATH_DIAGRAMS_GIT="https://github.com/${GITHUB_REPOSITORY}tree/main$PATH_DIAGRAMS"

# if [ -z "$TOKEN" ]; then
#     echo "Token is not specified"
#     exit 1
# fi

function SetConfigsGit() {
    # get configs git
    author=`git log -1 --format="%an"`
    email=`git log -1 --format="%ae"`
    message=`git log -1 --format="%s"`

    # set configs git
    git config --global user.email "$email"
    git config --global user.name "$author"
}

function getWikiRepository() {
    cd ..

    # The default name for the wiki repository.
    TEMP_REPO_NAME="wiki-repo" 

    # clone wiki repository
    git clone "https://$GITHUB_ACTOR:$TOKEN@github.com/$GITHUB_REPOSITORY.wiki.git" "$TEMP_REPO_NAME"
    # move to wiki repository
    cd $TEMP_REPO_NAME 
}

function getAllSvgs() {
    FILES_SVG=$(ls .$PATH_DIAGRAMS -t -U | grep '\.svg')
    for i in $FILES_SVG; do
        doMarkdown $i
    done
}

function doMarkdown() {
    file_path="$PATH_DIAGRAMS_GIT/$i"
    echo "## first"
    echo $file_path
}

getAllSvgs

# echo "#BOA" >> Funfou.md
# git add .
# git commit -m "$message" && git push "https://$GITHUB_ACTOR:$TOKEN@github.com/$GITHUB_REPOSITORY.wiki.git"
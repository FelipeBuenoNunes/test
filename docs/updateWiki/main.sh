#!/bin/bash 
GITHUB_REPOSITORY="FelipeBuenoNunes/test"
PATH_DIAGRAMS="/docs/diagram"
PATH_DIAGRAMS_LOCAL=$PATH_DIAGRAMS
PATH_DIAGRAMS_GIT="https://github.com/${GITHUB_REPOSITORY}/blob/main$PATH_DIAGRAMS"
echo $PATH_DIAGRAMS_LOCAL
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
    #Update path local
    PATH_DIAGRAMS_LOCAL=../$(echo $GITHUB_REPOSITORY | grep '/[[:alnum:]\-\.\_]\+$' --only-matching)$PATH_DIAGRAMS
    # remove old file
    rm diagrams.md
}

function getAllSvgs() {
    FILES_SVG=$(ls .$PATH_DIAGRAMS_LOCAL -t -U | grep '\.svg')
    for i in $FILES_SVG; do
        doMarkdown $i
    done
}

function doMarkdown() {
    file_path="$PATH_DIAGRAMS_GIT/$1"
    getNameToNewFile $1
    echo "## $name_new_file" >> diagrams.md
    echo "![$1]($file_path)" >> diagrams.md
}

function getNameToNewFile() {
    name_new_file=`expr match "$1" '\([a-z_]*\)'` # remove .svg
    name_new_file=${name_new_file//_/ } # replace _ to blank space
    name_new_file=${name_new_file^} # first letter uppercase
}

function doPush() {
    git diff
}

getWikiRepository
getAllSvgs

# echo "#BOA" >> Funfou.md
# git add .
# git commit -m "$message" && git push "https://$GITHUB_ACTOR:$TOKEN@github.com/$GITHUB_REPOSITORY.wiki.git"
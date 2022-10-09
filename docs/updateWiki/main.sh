#!/bin/sh

if [ -z "$TOKEN" ]; then
    echo "Token is not specified"
    exit 1
fi

# The default name for the wiki repository.
TEMP_REPO_NAME="wiki-repo" 

# get configs git
author=`git log -1 --format="%an"`
email=`git log -1 --format="%ae"`
message=`git log -1 --format="%s"`

# set configs git
git config --global user.email "$email"
git config --global user.name "$author"

# clone wiki repository
git clone "https://$GITHUB_ACTOR:$TOKEN@github.com/$GITHUB_REPOSITORY.wiki.git" "$TEMP_REPO_NAME"
cd $TEMP_REPO_NAME

echo "#BOA" >> Funfou.md
git add .
git commit -m "$message" && git push "https://$GITHUB_ACTOR:$TOKEN@github.com/$GITHUB_REPOSITORY.wiki.git"
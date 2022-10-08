#!/bin/sh

if [ -z "$TOKEN" ]; then
    echo "Token is not specified"
    exit 1
fi

TEMP_REPO_NAME="wiki-repo"

echo $TOKEN
# Clone repository
#git clone "https://$GITHUB_ACTOR:$TOKEN@github.com/$GITHUB_REPOSITORY"
#cd "$GITHUB_REPOSITORY"
author=`git log -1 --format="%an"`
email=`git log -1 --format="%ae"`
message=`git log -1 --format="%s"`
git config --local user.email "$email"
git config --local user.name "$author"
echo author
echo email
echo message

git clone "https://$GITHUB_ACTOR:$TOKEN@github.com/$GITHUB_REPOSITORY.wiki.git" "$TEMP_REPO_NAME"
ls
cd $TEMP_REPO_NAME
echo "#BOA" >> Fundou.md
ls
git commit -m "$message" && git push "https://$GITHUB_ACTOR:$GH_TOKEN@github.com/$GITHUB_REPOSITORY.wiki.git"
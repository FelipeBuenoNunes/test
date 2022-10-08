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
git clone "https://$GITHUB_ACTOR:$TOKEN@github.com/$GITHUB_REPOSITORY.wiki.git" "$TEMP_REPO_NAME"
ls
cd $TEMP_REPO_NAME
ls
#git commit -m "$message" && git push "https://$GITHUB_ACTOR:$GH_TOKEN@github.com/$GITHUB_REPOSITORY.wiki.git"
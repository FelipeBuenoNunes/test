#!/bin/sh

if [ -z "$TOKEN" ]; then
    echo "Token is not specified"
    exit 1
fi

echo $TOKEN
# Clone repository
#git clone "https://$GITHUB_ACTOR:$TOKEN@github.com/$GITHUB_REPOSITORY"
#cd "$GITHUB_REPOSITORY"
echo "https://$GITHUB_ACTOR:@github.com/$GITHUB_REPOSITORY.wiki.git"
git clone "https://$GITHUB_ACTOR:$TOKEN@github.com/$GITHUB_REPOSITORY.wiki.git"
ls
#git commit -m "$message" && git push "https://$GITHUB_ACTOR:$GH_TOKEN@github.com/$GITHUB_REPOSITORY.wiki.git"
#!/bin/sh

if [ -z "$TOKEN" ]; then
    echo "Token is not specified"
    exit 1
fi

echo $TOKEN
# Clone repository
#git clone "https://$GITHUB_ACTOR:$TOKEN@github.com/$GITHUB_REPOSITORY"
#cd "$GITHUB_REPOSITORY"
pwd
ls
cd ..
pwd
ls
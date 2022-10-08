#!/bin/sh

if [ -z "$TOKEM" ]; then
    echo "Token is not specified"
    exit 1
fi

# Clone repository
git clone "https://$GITHUB_ACTOR:$GH_TOKEN@github.com/$GITHUB_REPOSITORY"
cd "$GITHUB_REPOSITORY"
pwd

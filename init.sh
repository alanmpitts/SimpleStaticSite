#! /bin/sh

DATE=`date`
# move to the content dir
cd /usr/share/nginx/html

# delete any old data on this volume
rm -rf .git
rm -rf *

# Pull in the new site content
git init
git remote add origin https://github.com/alanmpitts/SimpleStaticSite.git
git fetch
git checkout -ft origin/master

# get some content from the local environment
envsubst '${HOSTNAME} ${DATE}' < index.html > tmpind.html

mv tmpind.html index.html

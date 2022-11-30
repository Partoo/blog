#!/bin/bash -e
cd /Users/tao/Code/blog && hugo --minify
commit_message="$1"
git add .
git commit -m "$commit_message"
git push -u origin main

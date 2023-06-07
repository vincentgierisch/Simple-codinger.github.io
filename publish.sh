#! /bin/bash

echo "Build jekyll blog"
jekyll build
echo "Beam the stuff to the server"
scp -r _site/* vice15@vice15.lima-ssh.de:/home/webpages/lima-city/vice15/blog



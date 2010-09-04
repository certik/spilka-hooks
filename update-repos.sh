#! /usr/bin/env sh

set +e 
echo "Running as:"
id
echo "Updating repositories..."
cd /home/git/repositories/hermes.git
git fetch origin master:master
cd /home/git/repositories/femhub.git
git fetch origin master:master
cd /home/git/repositories/libfemhub.git
git fetch origin master:master
cd /home/git/repositories/agros2d.git
git fetch origin master:master
echo "  Done."

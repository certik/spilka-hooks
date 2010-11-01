#! /usr/bin/env sh

set +e 
echo "Running as:"
id
echo "Updating repositories..."
cd /home/git/repositories/hermes.git
git fetch origin +master:master
git update-server-info
cd /home/git/repositories/femhub.git
git fetch origin +master:master
git update-server-info
cd /home/git/repositories/libfemhub.git
git fetch origin +master:master
git update-server-info
cd /home/git/repositories/agros2d.git
git fetch origin +master:master
git update-server-info
cd /home/git/repositories/mesheditor-flex.git
git fetch origin +master:master
git update-server-info
cd /home/git/repositories/himg.git
git fetch origin +master:master
git update-server-info
echo "  Done."

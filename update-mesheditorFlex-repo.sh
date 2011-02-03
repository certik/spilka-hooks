#! /usr/bin/env sh

set +e 
echo "Running as:"
id
echo "Updating repository..."
cd /home/git/repositories/mesheditor-flex.git
git fetch origin +master:master
git update-server-info
echo "  Done."


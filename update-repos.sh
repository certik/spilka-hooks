#! /usr/bin/env sh

set +e 
echo "Running as:"
id
echo "Updating repository..."
cd /home/git/repositories/hermes.git
git fetch origin master:master
echo "  Done."
echo "Updating docs..."
cd /var/www2/hermes/hermes
export GIT_DIR=`pwd`/.git
/usr/bin/git reset --hard
/usr/bin/git clean -dfx
/usr/bin/git pull origin master
echo "Building doc ..."
cd doc
make html
echo "Done Building doc !"

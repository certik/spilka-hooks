#! /usr/bin/env sh

set +e 
echo "Running as:"
id
echo "Updating repository..."
cd /home/git/repositories/himg.git
git fetch origin +master:master
git update-server-info
echo "  Done."
echo "Updating docs..."
cd /var/www2/himg/himg
export GIT_DIR=`pwd`/.git
/usr/bin/git reset --hard
/usr/bin/git clean -dfx
/usr/bin/git pull origin master
echo "Building doc ..."
cd doc
make html
echo "Done Building doc !"

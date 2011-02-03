#! /usr/bin/env sh

set +e 
echo "Running as:"
id

#---- Updating Repository ---------
echo "Updating repository..."
cd /home/git/repositories/femhub.git
git fetch origin +master:master
git update-server-info
echo "  Done."

#----- Update Documentation ----
echo "Updating docs..."
cd /var/www3/femhub.org/femhub
export GIT_DIR=`pwd`/.git
/usr/bin/git reset --hard
/usr/bin/git clean -dfx
/usr/bin/git pull origin master
echo "Building doc ..."
cd doc
make html
echo "Done Building doc !"

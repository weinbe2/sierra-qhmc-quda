#! /bin/bash

echo ""
echo "########"
echo "# QHMC #"
echo "########"

source env.sh

pushd $(pwd)

# Download, reconfigure
cd $BASEDIR/lqcd/src
git clone https://github.com/jcosborn/qhmc
pushd $(pwd)
mv qhmc qhmc-git
cd qhmc-git
autoreconf

# Clean up build directory just in case
cd $BASEDIR/lqcd/build/qhmc-git-quda/
rm -rf *

# Build and install
cd $BASEDIR/qinstall
./qinstall sierra-quda qhmc git

popd

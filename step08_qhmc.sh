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

# Build and install
cd $BASEDIR/qinstall
./qinstall sierra-quda qhmc git

popd

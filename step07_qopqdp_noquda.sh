#! /bin/bash

echo ""
echo "#######"
echo "# QDP #"
echo "#######"

source env.sh

pushd $(pwd)

# Download, reconfigure
cd $BASEDIR/lqcd/src
git clone https://github.com/usqcd-software/qopqdp
rm -rf qopqdp-git2
mv qopqdp qopqdp-git2
cd qopqdp-git2
autoreconf

# Build and install
cd $BASEDIR/qinstall
echo $(pwd)
./qinstall sierra-quda-no qopqdp git2

popd

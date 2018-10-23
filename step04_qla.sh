#! /bin/bash

echo ""
echo "#######"
echo "# QLA #"
echo "#######"

source env.sh

pushd $(pwd)

# Download, reconfigure
cd $BASEDIR/lqcd/src
git clone https://github.com/usqcd-software/qla
mv qla qla-git
cd qla-git
autoreconf

# Clean up build directory just in case
cd $BASEDIR/lqcd/build/qla-git-omp/
rm -rf *


# Build and install
cd $BASEDIR/qinstall
./qinstall sierra-quda qla git

popd

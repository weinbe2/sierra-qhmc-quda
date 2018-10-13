#! /bin/bash

echo ""
echo "#######"
echo "# QMP #"
echo "#######"

source env.sh

pushd $(pwd)

# Download, reconfigure
cd $BASEDIR/lqcd/src
git clone https://github.com/usqcd-software/qmp
mv qmp qmp-git
cd qmp-git
autoreconf

# Build and install
cd $BASEDIR/qinstall
./qinstall sierra-quda qmp git

popd

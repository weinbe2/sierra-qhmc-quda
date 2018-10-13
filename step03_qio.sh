#! /bin/bash

echo ""
echo "#######"
echo "# QIO #"
echo "#######"

source env.sh

pushd $(pwd)

cd $BASEDIR/lqcd/src
git clone https://github.com/usqcd-software/qio
mv qio qio-git
cd qio-git
pushd $(pwd)
cd other_libs
rm -rf c-lime
git clone https://github.com/usqcd-software/c-lime
cd c-lime
autoreconf
popd
autoreconf

# Build and install
cd $BASEDIR/qinstall
./qinstall sierra-quda qio git

popd

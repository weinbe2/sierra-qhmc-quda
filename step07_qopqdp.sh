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
mv qopqdp qopqdp-git
cd qopqdp-git/lib
sed -i 's:double u0 = 1;://double u0 = 1;:g' common_p.c
sed -i 's:u0,://u0,:g' common_p.c
cd ..
autoreconf

# Build and install
cd $BASEDIR/qinstall
./qinstall sierra-quda qopqdp git

popd

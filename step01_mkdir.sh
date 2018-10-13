#! /bin/bash

echo ""
echo "#########"
echo "# SETUP #"
echo "#########
"
source env.sh

pushd $(pwd)

cd $BASEDIR

# make quda directory, lqcd directory, subdirectories.
mkdir quda
mkdir quda/build
mkdir quda/eigen
mkdir lqcd
mkdir lqcd/download
mkdir lqcd/src
mkdir lqcd/build
mkdir lqcd/install

# Download qinstall, copy in sierra-quda profile

git clone https://github.com/usqcd-software/qinstall
cp ${GITDIR}/sierra-quda.prf qinstall/

# I need to `sed` some directories into `sierra-quda.prf`

popd


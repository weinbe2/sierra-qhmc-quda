#! /bin/bash

echo ""
echo "#######"
echo "# QIO #"
echo "#######"

source "$(cd "$(dirname "$BASH_SOURCE")"&&pwd)/env.sh"

cd $BASEDIR/lqcd/src
if [[ -d qio-git ]];then
	cd qio-git
	git pull
	git submodule update
else
	git clone https://github.com/usqcd-software/qio qio-git
	cd qio-git
	git submodule update --init
fi
autoreconf

# Clean up build directory
rm -rf "$BASEDIR/lqcd/build/qio-git/"

# Build and install
cd $BASEDIR/qinstall
./qinstall sierra-quda qio git

#! /bin/bash

echo ""
echo "########"
echo "# QHMC #"
echo "########"

source "$(cd "$(dirname "$BASH_SOURCE")"&&pwd)/env.sh"

# Download, reconfigure
cd $BASEDIR/lqcd/src
if [[ -d qhmc-git ]];then
	cd qhmc-git
	git pull
else
	git clone https://github.com/jcosborn/qhmc qhmc-git
	cd qhmc-git
fi
autoreconf

# Clean up build directory just in case
rm -rf "$BASEDIR/lqcd/build/qhmc-git-quda/"

# Build and install
cd $BASEDIR/qinstall
./qinstall sierra-quda qhmc git

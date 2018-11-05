#! /bin/bash

echo ""
echo "#######"
echo "# QMP #"
echo "#######"

source "$(cd "$(dirname "$BASH_SOURCE")"&&pwd)/env.sh"

# Download, reconfigure
cd $BASEDIR/lqcd/src
if [[ -d qmp-git ]];then
	cd qmp-git
	git pull
else
	git clone https://github.com/usqcd-software/qmp qmp-git
	cd qmp-git
fi
autoreconf

# Clean up build directory just in case
rm -rf "$BASEDIR/lqcd/build/qmp-git/"

# Build and install
cd $BASEDIR/qinstall
./qinstall sierra-quda qmp git

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
	git stash
	git pull
	if git stash show > /dev/null;then git stash pop;fi
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

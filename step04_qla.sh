#! /bin/bash

echo ""
echo "#######"
echo "# QLA #"
echo "#######"

source "$(cd "$(dirname "$BASH_SOURCE")"&&pwd)/env.sh"

# Download, reconfigure
cd $BASEDIR/lqcd/src
if [[ -d qla-git ]];then
	cd qla-git
	git stash
	git pull
	if git stash show > /dev/null;then git stash pop;fi
else
	git clone https://github.com/usqcd-software/qla qla-git
	cd qla-git
fi
autoreconf

# Clean up build directory just in case
rm -rf "$BASEDIR/lqcd/build/qla-git-omp/"

# Build and install
cd $BASEDIR/qinstall
./qinstall sierra-quda qla git

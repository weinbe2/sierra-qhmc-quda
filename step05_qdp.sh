#! /bin/bash

echo ""
echo "#######"
echo "# QDP #"
echo "#######"

source "$(cd "$(dirname "$BASH_SOURCE")"&&pwd)/env.sh"

# Download, reconfigure
cd $BASEDIR/lqcd/src
if [[ -d qdp-git ]];then
	cd qdp-git
	git pull
else
	git clone https://github.com/usqcd-software/qdp qdp-git
	cd qdp-git
	sed -i 's/doc //g' Makefile.am # doc complains b/c of no makeinfo
fi
autoreconf

# Clean up build directory just in case
rm -rf "$BASEDIR/lqcd/build/qdp-git-omp/"

# Build and install
cd $BASEDIR/qinstall
./qinstall sierra-quda qdp git

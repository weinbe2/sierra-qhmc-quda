#! /bin/bash

echo ""
echo "##########"
echo "# QOPQDP #"
echo "##########"

source "$(cd "$(dirname "$BASH_SOURCE")"&&pwd)/env.sh"

# Download, reconfigure
cd $BASEDIR/lqcd/src
if [[ -d qopqdp-git ]];then
	cd qopqdp-git
	git stash
	git pull
	if git stash show > /dev/null;then git stash pop;fi
else
	git clone https://github.com/usqcd-software/qopqdp qopqdp-git
	cd qopqdp-git/lib
	sed -i 's:double u0 = 1;://double u0 = 1;:g' common_p.c
	sed -i 's:u0,://u0,:g' common_p.c
	cd ..
fi
autoreconf

# Clean up build directory just in case
rm -rf "$BASEDIR/lqcd/build/qopqdp-git-quda/"

# Build and install
cd $BASEDIR/qinstall
./qinstall sierra-quda qopqdp git

#! /bin/bash

echo ""
echo "##########"
echo "# QOPQDP #"
echo "##########"

# something wrong with the default xl/beta-2018.10.29
# I'm getting
# /usr/tce/packages/xl/xl-beta-2018.10.29/xlC/16.1.1/bin/.orig/xlc_r: error: 1501-230 Internal compiler error; please contact your Service Representative.
# use gcc for now
module load gcc/7.3.1

source "$(cd "$(dirname "$BASH_SOURCE")"&&pwd)/env.sh"

# Download, reconfigure
cd $BASEDIR/lqcd/src
if [[ -d qopqdp-git ]];then
	cd qopqdp-git
	git pull
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

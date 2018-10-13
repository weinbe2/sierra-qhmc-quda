# For Sierra: update your modules to use `gcc/7.3.1`, `cmake/3.12.1`. 

source env.sh

# Create directories, download qinstall
./step01_mkdir.sh

# Download, configure, install qmp
./step02_qmp.sh

# Download, configure, install qio
./step03_qio.sh

# Download, configure, install qla
#./step04_qla.sh

# Download, configure, install qdp
#./step05_qdp.sh

# Download, configure, install quda
./step06_quda.sh

# Download, configure, install qopqdp-quda
#./step07_qopqdp.sh

# Download, configure, install qhmc-quda
#./step08_qhmc.sh

# Set up run directory
#./step09_rundir.sh

exit

# USER INPUT: specify the git repo directory and the install directory
GITDIR=/usr/workspace/wsb/weinberg/script_stack/sierra-qhmc-quda/
BASEDIR=/usr/workspace/wsb/weinberg/script_stack/

# Update modules right of the bat
module load cmake/3.12.1
module load gcc/7.3.1

cd $BASEDIR

# Spawn directories

pushd $(pwd)

# make quda directory, lqcd directory, subdirectories.
mkdir quda
mkdir quda/build
mkdir quda/eigen
mkdir lqcd
mkdir lqcd/download
mkdir lqcd/src
mkdir lqcd/build
mkdir lqcd/install

# Go go go
cd lqcd/src

git clone https://github.com/usqcd-software/qmp
pushd $(pwd)
mv qmp qmp-git
cd qmp-git
autoreconf
popd

git clone https://github.com/usqcd-software/qio
pushd $(pwd)
mv qio qio-git
cd qio-git
pushd $(pwd)
cd other_libs
rm -rf c-lime
git clone https://github.com/usqcd-software/c-lime
cd c-lime
autoreconf
popd
autoreconf
popd

git clone https://github.com/usqcd-software/qla
pushd $(pwd)
mv qla qla-git
cd qla-git
autoreconf
popd

git clone https://github.com/usqcd-software/qdp
pushd $(pwd)
mv qdp qdp-git
cd qdp-git
sed -i 's/doc //g' Makefile.am # doc complains b/c of no makeinfo
autoreconf
popd

git clone https://github.com/usqcd-software/qopqdp
pushd $(pwd)
mv qopqdp qopqdp-git
cd qopqdp-git
pushd $(pwd)
cd lib
sed -i 's:double u0 = 1;://double u0 = 1;:g' common_p.c
sed -i 's:u0,://u0,:g' common_p.c
popd
autoreconf
popd

git clone https://github.com/jcosborn/qhmc
pushd $(pwd)
mv qhmc qhmc-git
cd qhmc-git
autoreconf
popd

popd


# Set up qinstall

git clone https://github.com/usqcd-software/qinstall
pushd $(pwd)
cd qinstall

./qinstall sierra-quda qmp git
./qinstall sierra-quda qio git
./qinstall sierra-quda qla git
./qinstall sierra-quda qdp git

# Go set up QUDA.

popd 

mkdir quda
pushd $(pwd)
cd quda
git clone https://github.com/lattice/quda
mkdir build
cd build
cmake ../quda
ccmake .
# do configuring, including linking to the correct versions of QMP and QIO.
make -j[whatever]

popd

# Continue building the scidac stack

pushd $(pwd)
cd qinstall
./qinstall sierra-quda qopqdp git
./qinstall sierra-quda qhmc git
popd

# And we're done!
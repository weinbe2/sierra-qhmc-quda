#! /bin/bash

echo ""
echo "########"
echo "# QUDA #"
echo "########"

echo ""
echo "(Go grab a coffee.)"
echo ""

source env.sh

pushd $(pwd)

# Download Eigen (for now, this shouldn't be an issue...)
cd $BASEDIR/quda/eigen/
wget  http://bitbucket.org/eigen/eigen/get/3.3.5.tar.bz2
tar -xvjf 3.3.5.tar.bz2
mv eigen* Eigen
rm -rf *.tar.bz2

# To QUDA!

# Download, reconfigure
cd $BASEDIR/quda/
git clone https://github.com/lattice/quda
cd build
cmake ../quda/ \
-DEIGEN_INCLUDE_DIR=${EIGENDIR} \
-DQUDA_DIRAC_CLOVER=ON \
-DQUDA_DIRAC_DOMAIN_WALL=ON \
-DQUDA_DIRAC_NDEG_TWISTED_MASS=OFF \
-DQUDA_DIRAC_STAGGERED=ON \
-DQUDA_DIRAC_TWISTED_CLOVER=OFF \
-DQUDA_DIRAC_TWISTED_MASS=OFF \
-DQUDA_DIRAC_WILSON=ON \
-DQUDA_DOWNLOAD_EIGEN=OFF \
-DQUDA_GPU_ARCH=sm_70 \
-DQUDA_LIMEHOME=${QIODIR} \
-DQUDA_LINK_ASQTAD=ON \
-DQUDA_LINK_HISQ=ON \
-DQUDA_MULTIGRID=OFF \
-DQIO=ON \
-DQIOHOME=${QIODIR} \
-DQMP=ON \
-DQMPHOME=${QMPDIR}

nice make -j32

popd


# USER INPUT: specify the git repo directory and the install directory
GITDIR=/nfs/tmp2/lsd/weinberg/bin/sierra-qhmc-quda/
BASEDIR=/nfs/tmp2/lsd/weinberg/bin/scidac/

# Various directories of note
QIODIR=${BASEDIR}/lqcd/install/qio/
QMPDIR=${BASEDIR}/lqcd/install/qio/
QUDADIR=${BASEDIR}/quda/build/
EIGENDIR=${BASEDIR}/quda/eigen/Eigen/

# Update modules right of the bat
module load cmake/3.12.1
module load gcc/7.3.1


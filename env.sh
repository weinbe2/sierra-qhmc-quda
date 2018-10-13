
# USER INPUT: specify the git repo directory and the install directory
GITDIR=/usr/workspace/wsb/weinberg/script_stack/sierra-qhmc-quda
BASEDIR=/usr/workspace/wsb/weinberg/script_stack/software

# Various directories of note
QIODIR=${BASEDIR}/lqcd/install/qio/
QMPDIR=${BASEDIR}/lqcd/install/qio/
QUDADIR=${BASEDIR}/quda/build/
EIGENDIR=${BASEDIR}/quda/eigen/Eigen/

# Update modules right of the bat
module load cmake/3.12.1
module load gcc/7.3.1


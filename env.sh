# Subshell will source it again because this variable is not exported.
[[ -z ${SOURCE_ONCE_ENV_SH+X} ]] || return
SOURCE_ONCE_ENV_SH=1

set -eu -o pipefail

# USER INPUT: specify the git repo directory and the install directory
BASEDIR="$HOME/pkg_sierra"

# Various directories of note
QIODIR=${BASEDIR}/lqcd/install/qio/
QMPDIR=${BASEDIR}/lqcd/install/qmp/
QUDADIR=${BASEDIR}/quda/build/
EIGENDIR=${BASEDIR}/quda/eigen/Eigen/

GITDIR=$(cd "$(dirname "$BASH_SOURCE")"&&pwd)


run(){
	DONE="$BASEDIR/DONE_$1"
	if [[ -f $DONE ]];then
		echo "# SKIPPING $1"
		echo "#	Remove $DONE to force rerun"
		return
	fi
	echo "##########"
	echo "# STARTING $1"
	echo "##########"
	"$GITDIR/$1"
	touch $DONE
}

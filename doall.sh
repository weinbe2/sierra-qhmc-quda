#!/usr/bin/env bash
set -eu -o pipefail

echo "Running everything..."
source "$(dirname $BASH_SOURCE)/env.sh"

# Create directories, download qinstall
run step01_mkdir.sh

# Download, configure, install qmp
run step02_qmp.sh

# Download, configure, install qio
run step03_qio.sh

# Download, configure, install qla
run step04_qla.sh

# Download, configure, install qdp
run step05_qdp.sh

# Download, configure, install quda
run step06_quda.sh

# Download, configure, install qopqdp-quda
run step07_qopqdp.sh

# Download, configure, install qhmc-quda
run step08_qhmc.sh

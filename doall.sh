# For Sierra: update your modules to use `gcc/7.3.1`, `cmake/3.12.1`. 

echo "Running everything..."

# Create directories, download qinstall
./step01_mkdir.sh

# Download, configure, install qmp
./step02_qmp.sh

# Download, configure, install qio
./step03_qio.sh

# Download, configure, install qla
./step04_qla.sh

# Download, configure, install qdp
./step05_qdp.sh

# Download, configure, install quda
./step06_quda.sh

# Download, configure, install qopqdp-quda
./step07_qopqdp.sh

# Download, configure, install qhmc-quda
./step08_qhmc.sh

#!/bin/bash
APP=$*
# QUDA specific-environment variables
# enable GDR support
#export QUDA_ENABLE_GDR=1

# this is the list of GPUs we have
GPUS=(0 1 2 3)

# This is the list of NICs we should use for each GPU
NICS=(mlx5_1 mlx5_1 mlx5_3 mlx5_3)

# This is the list of CPU cores we should use for each GPU
#CPUS=(0-31 32-63 64-95 96-127)
CPUS=(0,8,16,24 32,40,48,56 88,96,104,112 120,128,136,144)

# Number of physical CPU cores per GPU
export OMP_NUM_THREADS=4

# this is the order we want the GPUs to be assigned in (e.g. for NVLink connectivity)
REORDER=(0 1 2 3)

# now given the REORDER array, we set CUDA_VISIBLE_DEVICES, NIC_REORDER and CPU_REORDER to for this mapping

export CUDA_VISIBLE_DEVICES="${GPUS[${REORDER[0]}]},${GPUS[${REORDER[1]}]},${GPUS[${REORDER[2]}]},${GPUS[${REORDER[3]}]}"
NIC_REORDER=(${NICS[${REORDER[0]}]} ${NICS[${REORDER[1]}]} ${NICS[${REORDER[2]}]} ${NICS[${REORDER[3]}]})
CPU_REORDER=(${CPUS[${REORDER[0]}]} ${CPUS[${REORDER[1]}]} ${CPUS[${REORDER[2]}]} ${CPUS[${REORDER[3]}]})
#MEM_BIND=(0 0 8 8)

#lrank=$OMPI_COMM_WORLD_LOCAL_RANK
lrank=$(($PMIX_RANK % 4))

export OMPI_MCA_btl_openib_if_include=${NIC_REORDER[lrank]}
#numactl --physcpubind=${CPU_REORDER[$lrank]} --membind=${MEM_BIND[$lrank]} $APP
numactl --physcpubind=${CPU_REORDER[$lrank]} $APP


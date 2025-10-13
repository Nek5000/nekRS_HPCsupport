```
module use /soft/modulefiles
module use /opt/cray/pe/lmod/modulefiles/mix_compilers
module load libfabric
module load PrgEnv-gnu
module load nvhpc-mixed
module load craype-x86-milan craype-accel-nvidia80
module load spack-pe-base cmake

# path to target installed location
export NEKRS_HOME=<your prefered location>/nekrs

CC=cc CXX=CC FC=ftn ./build.sh -DCMAKE_INSTALL_PREFIX=$NEKRS_HOME 
```

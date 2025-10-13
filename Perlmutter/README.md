## Install

```
module load PrgEnv-gnu
module load cudatoolkit
module load cpe-cuda
module load cmake
module unload cray-libsci

# path to target installed location
export NEKRS_HOME=<your prefered location>/.local/nekrs

CC=cc CXX=CC FC=ftn ./build.sh -DCMAKE_INSTALL_PREFIX=$NEKRS_HOME -DOCCA_ENABLE_DPCPP=0 
```

## Install

### PrgEnv-amd

```
module reset
module load PrgEnv-amd
module load craype-accel-amd-gfx90a
module load cray-mpich
module load rocm
module load cmake
module unload cray-libsci darshan-runtime

module list

# path to target installed location
export NEKRS_HOME=<your prefered location>/nekrs

CC=cc CXX=CC FC=ftn ./build.sh -DCMAKE_INSTALL_PREFIX=$NEKRS_HOME
```

### PrgEnv-gnu
```
module load PrgEnv-gnu
module load gcc-native/13.2 # the default 14.2 has issue
module load craype-accel-amd-gfx90a
module load cray-mpich
module load rocm
module load cmake
module unload cray-libsci
module list

# path to target installed location
export NEKRS_HOME=<your prefered location>/nekrs

CC=cc CXX=CC FC=ftn ./build.sh \
  -DCMAKE_INSTALL_PREFIX=$NEKRS_HOME \
  -DENABLE_HYPRE_GPU=off
```

## Run

The submit script has both environment. Set your preferred PrgEnv by specifying the env-var `USE_COMPILER`. For example,
```
USE_COMPILER=gnu $NEKRS_HOME/bin/nrsqsub_frontier ethier 1 00:30
```

```
module load cmake
module list

# path to target installed location
export NEKRS_HOME=<your prefered location>/nekrs

CC=mpicc CXX=mpic++ FC=mpif77 ./build.sh -DCMAKE_INSTALL_PREFIX=$NEKRS_HOME 
```

## Install

```
module restore
module use /soft/modulefiles
module swap PrgEnv-nvidia PrgEnv-gnu
module load cudatoolkit-standalone/12.6
module load cuda/12.9
module load gcc-native/13.2
module load craype-x86-milan craype-accel-nvidia80
module load spack-pe-base cmake

# path to target installed location
export NEKRS_HOME=<your prefered location>/nekrs

CC=cc CXX=CC FC=ftn ./build.sh -DCMAKE_INSTALL_PREFIX=$NEKRS_HOME 
```

## Update


**2025-08-29**

The new Polaris HPCM update seems to introduce bug in MPI RMA.
Add `export MPIR_CVAR_CH4_OFI_ENABLE_RMA=0` to avoid hangs.

**2025-11-18**

`nvhpc-mixed` is deprecated and `nvidia-mixed` will soon to be deprecated as well.
Switch to `cuda` and `cudatoolkit-standalone`. Pin cuda 12.6 and gcc 13.2 for compatibility.

**2026-01-05**

The `cude/12.6` module is gone after the update. Swtich to `cuda/12.9`.

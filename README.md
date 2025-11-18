# nekRS HPC support

This repo offers scripts and a brief installation guide for running
[**nekRS**](https://github.com/Nek5000/NekRS.git) on common HPC systems.
It’s community-maintained and may change as systems are frequently updated.
The scripts target the latest nekRS, but older branches should work with minor
tweaks.

**Note:** This is **not** a general nekRS installation guide. For full
 documentation, see the [readthedocs page](https://nekrs.readthedocs.io/en/latest/).


## Install

After installing **nekRS**, set `NEKRS_HOME` in your environment, then clone
this repository for the latest scripts:
```sh
git clone https://github.com/Nek5000/nekRS_HPCsupport
cd nekRS_HPCsupport
```

With `NEKRS_HOME` pointing to your nekRS installation, run:
```sh
./install.sh
```

The HPC scripts will be installed into `$NEKRS_HOME/bin` with a lower case
machine-name suffix. For example:
```sh
$NEKRS_HOME/bin/nrsqsub_frontier
```


## Usage

A typical usage looks like this (see the variables section below for all options):
```sh
PROJ_ID=<project> ./nrsqsub_frontier <case> <#nodes> <hh:mm>
```

- `PROJ_ID`: your allocation/account
- `case`: case name, `.par` or `.sess` file
- `#nodes`: number of nodes
- `hh:mm`: walltime (hours:minutes).

Example:
```sh
# Get turbPipePeriodic example
cp -r $NEKRS_HOME/examples/turbPipePeriodic .
cd turbPipePeriodic

# Request 1 node, 30 mins on Frontier
PROJ_ID=ABC123 ./nrsqsub_frontier turbPipe.par 1 00:30
```

You can see the full list of environment variables via `--help`:
```sh
$ ./nrsqsub_frontier --help

Usage: [<env-var>] $0 <par or sess file> <number of compute nodes> <hh:mm>

env-var                 Values(s)   Description / Comment
------------------------------------------------------------------------------------
NEKRS_HOME              string      path to installation
PROJ_ID                 string      
QUEUE                   string      
CPUONLY                 0/1         backend=serial
RUN_ONLY                0/1         skip pre-compilation
BUILD_ONLY              0/1         run pre-compilation only
FP32                    0/1         run solver in single precision
OPT_ARGS                string      optional arguements e.g. "--cimode 1 --debug"
```


## Contributing

Pull requests are welcome for fixes, module or configuration updates, and
support for new systems. New scripts should target public multi-user HPC
systems, follow this repository's style and conventions, honor the existing
environment variables, and be tested end-to-end on the target machine. Please
also include a short per-system README covering modules, compilers, and any
quirks. For reference, see the bash functions defined in
`$NEKRS_HOME/scripts/nrsqsub_utils`.

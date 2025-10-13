# nekRS HPC support

This repo offers scripts and a brief installation guide to run
[**nekRS**](https://github.com/Nek5000/NekRS.git) on common HPC machines.
It’s community-maintained and subject to change with system updates.
It targets the latest nekRS but, in principle, older branches should work with
minimal tweaks.

**Note:** This is **not** a general nekRS install guide. See the main nekRS repo
for full instructions.


## Install

Clone our repo for the latest updates:
```sh
git clone https://github.com/Nek5000/nekRS_HPCsupport
cd nekRS_HPCsupport
```

With the `NEKRS_HOME` set to your nekRS installation, run:
```sh
./install.sh
```

The scripts will be installed to `$NEKRS_HOME/bin` with a machine-name postfix.
For example:
```sh
$NEKRS_HOME/bin/nrsqsub_frontier
```


## Usage

A typical usage looks like this (see the variables section below for all options):
```sh
PROJ_ID=<project> ./nrsqsub_frontier <case> <#nodes> <hh:mm>
```

- `PROJ_ID`: your allocation/account
- `<case>`: case name
- `<#nodes>`: number of nodes
- `<hh:mm>`: walltime (hours:minutes).

Example (1 node, 30 mins on Frontier)
```sh
cd $NEKRS_HOME/examples/turbPipePeriodic
PROJ_ID=ABC123 ./nrsqsub_frontier turbPipe.par 1 00:30
```

Full list of variables
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

Pull requests are welcome—for fixes, module/config updates, and new systems.
New scripts should target public multi-user HPC systems, follow the repo’s style,
support existing env vars, be tested end-to-end, and include a short per-system
README (modules, compilers, quirks).

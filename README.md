# Parflow Docker 

This is a setup for running ParFlow under Docker.

This is a work in progress.

## Install Docker


Documentation for downloaing and installing Docker is available at: https://docs.docker.com/

## Download the ParFlow Docker example repository

This example repository has scripts and input for running a simple ParFlow example under Docker.

### Clone with git

If you have git installed, you can clone the example:

```bash
git clone git@github.com:smithsg84/docker.git
```

### Download zip file

If you do now have git, you can download a zip file of the example:

https://github.com/parflow/docker/archive/master.zip

## Building the image

The first step is building a Docker image for running ParFlow.  The
build script in the bin directory will build the image using the
latest ParFlow source.

### Unix/Linux/MacOS

```bash
./bin/build.sh
```

### Windows

```PowerShell
.\bin\build.bat
```

## Running

Running ParFlow using the Docker instance is similiar to how ParFlow
is run directly from the command line using TCL.  The tclsh command is
replaced with a platform specific script.

Where you see:

```bash
tclsh <arguments>
```

For the Docker instance use:

```bash
./bin/parflow.sh <arguments>
```

On Windows the script to use is parflow.bat.


### Unix/Linux/MacOS

To execute the default_single test case run with

```bash
./bin/parflow.sh default_single.tcl 1 1 1
```

This wrapper script is invoked as one would invoke TCL outside of
docker.  In this case we supply the TCL ParFlow input file (which is
always required) and the core topology (in this case a 1
core along the  X/Y/Z axis).

To run this same problem in parallel:

```bash
./bin/parflow.sh default_single.tcl 2 1 1
```

Will split the problem in the X axis across two cores.


### Windows

To execute the default_single test case run with

```PowerShell
.\bin\parflow.bat default_single.tcl 1 1 1
```

This wrapper script is invoked as one would invoke TCL outside of
docker.  In this case we supply the TCL ParFlow input file (which is
always required) and the core topology (in this case a 1
core along the  X/Y/Z axis).

To run this same problem in parallel:

```PowerShell
.\bin\parflow.bat default_single.tcl 2 1 1
```

Will split the problem in the X axis across two cores.

#### Running Docker with multiple cores on Windows

Docker needs to be configured to run on multiple cores under Windows.
In the Docker Desktop go to the Settings -> Advanced tab to set the
number of CPU's docker will use.  This will be a small number,
normally 1 or 2, by default.

This panel also controls the memory allocated for the Docker
instances.  The default memory is typically 1 or 2 GB.  For large
problems this will need to be increased.

#### Special file issues on Windows

Windows Docker support currently has issues with files ownership.  The
files created when running will be owned by the Administrator account.
The files are readable by you and you can delete files BUT directories
can only be deleted by an Administrator account.

We are looking at how to better manage this issue; this is a known
'feature' of Docker on Windows.

## Output

The 

	 

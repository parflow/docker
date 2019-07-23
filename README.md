# Parflow Docker 

This is basic setup for running ParFlow under Docker.   

We have just started supporting Docker so please report issues at the ParFlow issue tracker: https://github.com/parflow/parflow/issues

## Install Docker


Documentation for downloading and installing Docker is available at: https://docs.docker.com/

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

## Running

Running ParFlow using the Docker instance is similiar to how ParFlow
is run from the command line using TCL.  The tclsh command is
replaced with a platform specific script.

Where you see:

```bash
tclsh <arguments>
```

to run with the the Docker instance use the provided script:

```bash
./bin/parflow.sh <arguments>
```

On Windows the script to use is parflow.bat.

The first time you execute the 'parflow.bat' or 'parflow.sh' script
Docker will download the ParFlow image.  This requires an internet
connection and may take several minutes.

### Example on Unix/Linux/MacOS

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


### Example on Windows

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

Windows Docker support currently has issues with file ownership.  The
files created when will be owned by the Administrator account.
The files are readable by you and you can delete files BUT directories
can only be deleted by an Administrator account.

We are looking at how to better manage this issue; this is a known
'feature' of Docker on Windows.

## Output

The output of running the example will be placed in the
example directory.

Below is a list of files from a run done on windows.  The '*.txt' and
'*.log' files contain summary information about the turn.  The '*.silo'
and '*.pfb' files are the same output, simply stored in two different
formats.  The Silo files are viewable using Visit
(https://wci.llnl.gov/simulation/computer-codes/visit/).  See the
ParFlow user manual for more information on output.

```
Mode                LastWriteTime         Length Name
----                -------------         ------ ----
d-----        7/17/2019   9:19 AM                .git
d-----        7/17/2019   9:02 AM                bin
d-----        7/16/2019   3:30 PM                correct_output
d-----        7/17/2019   9:09 AM                default_single.out
-a----        7/17/2019   9:11 AM             40 .gitignore
-a----        7/17/2019   9:19 AM            184 default_single.out.concen.0.00.00000.pfsb
-a----        7/17/2019   9:19 AM           2765 default_single.out.concen.0.00.00000.silo
-a----        7/17/2019   9:19 AM            604 default_single.out.concen.0.00.00001.pfsb
-a----        7/17/2019   9:19 AM           2765 default_single.out.concen.0.00.00001.silo
-a----        7/17/2019   9:19 AM           1324 default_single.out.concen.0.00.00002.pfsb
-a----        7/17/2019   9:19 AM           2765 default_single.out.concen.0.00.00002.silo
-a----        7/17/2019   9:19 AM           1804 default_single.out.concen.0.00.00003.pfsb
-a----        7/17/2019   9:19 AM           2765 default_single.out.concen.0.00.00003.silo
-a----        7/17/2019   9:19 AM           2364 default_single.out.concen.0.00.00004.pfsb
-a----        7/17/2019   9:19 AM           2765 default_single.out.concen.0.00.00004.silo
-a----        7/17/2019   9:19 AM           2724 default_single.out.concen.0.00.00005.pfsb
-a----        7/17/2019   9:19 AM           2765 default_single.out.concen.0.00.00005.silo
-a----        7/17/2019   9:19 AM           2718 default_single.out.concen.press.silo
-a----        7/17/2019   9:19 AM           5208 default_single.out.log
-a----        7/17/2019   9:19 AM          17380 default_single.out.perm_x.pfb
-a----        7/17/2019   9:19 AM           2742 default_single.out.perm_x.silo
-a----        7/17/2019   9:19 AM          17380 default_single.out.perm_y.pfb
-a----        7/17/2019   9:19 AM           2742 default_single.out.perm_y.silo
-a----        7/17/2019   9:19 AM          17380 default_single.out.perm_z.pfb
-a----        7/17/2019   9:19 AM           2742 default_single.out.perm_z.silo
-a----        7/17/2019   9:19 AM           7991 default_single.out.pftcl
-a----        7/17/2019   9:19 AM          17380 default_single.out.porosity.pfb
-a----        7/17/2019   9:19 AM           2709 default_single.out.porosity.silo
-a----        7/17/2019   9:19 AM          17380 default_single.out.press.00000.pfb
-a----        7/17/2019   9:19 AM            713 default_single.out.timing.csv
-a----        7/17/2019   9:19 AM           4327 default_single.out.txt
-a----        7/17/2019   9:19 AM           1453 default_single.out.wells
-a----        7/17/2019   9:19 AM           5598 default_single.pfidb
-a----        7/17/2019   8:51 AM          13518 default_single.tcl
-a----        7/17/2019   9:07 AM           1071 Dockerfile
-a----        7/17/2019   8:51 AM           2972 pftest.tcl
-a----        7/17/2019   9:19 AM           3229 README.md
```
	 
## Running your ParFlow problem with Docker

Running your input with the Docker has one restriction using the
provided script; all input files must be contained in the current
working directory.  This includes the initial TCL input file and all
files that are used in the problem.  Subdirectories in the current
working directory are fine and will be available in the instance.
Soft links will not work.

Once you have all the files in the current working directory simply invoke
the script with the TCL file.  For example on Windows:

```PowerShell
.\bin\parflow.bat my_problem_setup.tcl
```

It is possible to share other directories with the Docker instance but
that is beyond the scope of this document.  You will need to bind
additional directories by changing the Docker command line.  See
Docker documenation for information on sharing host file systems with
the Docker instance.

## Running a specific version of ParFlow

By default the supplied script will download and execute the latest
version of ParFlow.  The released versions of ParFlow are also
available for ParFlow on DockerHub (starting with version 3.5.0).  To
run a specific version of ParFlow edit the script to run the desired
version and change the docker run line:

```PowerShell
docker run -v %cd%:/data parflow/parflow %1 %2 %3 %4 %5 %6 %7 %8 %9
```

and indicate the version desired:

```PowerShell
docker run -v %cd%:/data parflow/parflow:version-3.5.0 %1 %2 %3 %4 %5 %6 %7 %8 %9
```

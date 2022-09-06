#!/bin/bash

if docker ps >& /dev/null
then
   docker run --rm -v $(pwd):/data parflow/parflow:version-3.11.0 $*
elif singularity version >& /dev/null
then
   singularity run docker://parflow/parflow:version-3.11.0 $*
else
   echo "Couldn't run docker or singularity"
fi

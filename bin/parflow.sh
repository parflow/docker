#!/bin/bash

if docker ps >& /dev/null
then
   docker run --rm -v $(pwd):/data parflow/parflow $*
elif singularity version >& /dev/null
then
   singularity run docker://parflow/parflow $*
else
   echo "Couldn't run docker or singularity"
fi

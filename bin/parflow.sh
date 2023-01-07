#!/bin/bash

if podman --version >& /dev/null
then
   podman run --rm -v $(pwd):/data docker.io/parflow/parflow:latest $*
elif docker ps >& /dev/null
then
   docker run --rm -v $(pwd):/data parflow/parflow:latest $*
elif singularity version >& /dev/null
then
   singularity run docker://parflow/parflow:latest $*
else
   echo "Couldn't run podman, docker or singularity"
fi

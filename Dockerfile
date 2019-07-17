#-----------------------------------------------------------------------------
# start by building the basic container
#-----------------------------------------------------------------------------
FROM parflow/parflow:latest
MAINTAINER Steven Smith <smith84@llnl.gov>

#-----------------------------------------------------------------------------
# Set environment vars
#-----------------------------------------------------------------------------

ENV CMAKE_DIR /home/parflow/cmake-3.14.5-Linux-x86_64
ENV PARFLOW_DIR /home/parflow/parflow
ENV SILO_DIR /home/parflow/silo-4.10.2
ENV HYPRE_DIR /home/parflow/hypre
ENV PATH $PATH:/usr/lib64/openmpi/bin:$CMAKE_DIR/bin:$PARFLOW_DIR/bin
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/usr/lib64/openmpi/lib
ENV PARFLOW_MPIEXEC_EXTRA_FLAGS "--mca mpi_yield_when_idle 1 --oversubscribe --allow-run-as-root"

#-----------------------------------------------------------------------------
# Setup for running ParFlow
#-----------------------------------------------------------------------------

WORKDIR /data
ENTRYPOINT ["tclsh"]




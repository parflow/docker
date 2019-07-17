#!/bin/bash

docker run -v $(pwd):/data parflow/parflow $*

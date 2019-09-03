#!/bin/bash

docker run --rm -v $(pwd):/data parflow/parflow $*

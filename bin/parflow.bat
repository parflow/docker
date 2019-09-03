@echo off

docker run --rm -v %cd%:/data parflow/parflow %1 %2 %3 %4 %5 %6 %7 %8 %9


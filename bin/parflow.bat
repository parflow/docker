
@echo off

rem docker run --user 1000:1000 -v C:\Users\smith84\Documents\Docker\parflow\pfdocker\data:/data parflow default_single.tcl 1 1 1

docker run -v %cd%:/data parflow/parflow %1 %2 %3 %4 %5 %6 %7 %8 %9

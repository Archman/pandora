#!/bin/bash

infile=$1
ncores=$2
mpirun -n ${ncores} genesis3 ${infile}

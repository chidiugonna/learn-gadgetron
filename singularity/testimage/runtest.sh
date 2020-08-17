#!/bin/bash
#singularity container location is at $SINGLOC
SINGLOC=$PWD/../gadgetron.sandbox
singularity run -B $PWD:/mnt $SINGLOC $PWD/testscript.sh

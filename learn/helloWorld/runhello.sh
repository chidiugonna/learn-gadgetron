#!/bin/bash
shopt -s expand_aliases
# source aliases for convenient call of container
. $PWD/defineAliases.sh
mkdir -p ./results
gtron ismrmrd_generate_cartesian_shepp_logan -o /mnt/results/testdata.h5 -r 10
gtron gadgetron_ismrmrd_client -f /mnt/results/testdata.h5 -o /mnt/results/out.h5

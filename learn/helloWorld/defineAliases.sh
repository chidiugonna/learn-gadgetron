#!/bin/bash
export SINGLOC=$PWD/../../singularity/gadgetron.sandbox
echo "using $SINGLOC as location for singularity image"
shopt -s expand_aliases
alias gtron="singularity run -B $PWD:/mnt $SINGLOC --homedir /mnt"
alias startServer="gtron gadgetron"
alias viewer="gtron ismrmrdviewer"
alias hdfview="gtron hdfview"

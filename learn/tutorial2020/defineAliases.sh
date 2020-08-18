#!/bin/bash
echo "please make sure that you have sourced this from within folder Lesson_N"
export SINGLOC=$PWD/../../../singularity/gadgetron.sandbox
echo "using $SINGLOC as location for singularity image"
shopt -s expand_aliases
DATADIR=$PWD/../Gadgetron-2020-summer-school-data
alias gtron="singularity run -B $PWD:/mnt -B $DATADIR:/media $SINGLOC --homedir /mnt"
alias startServer="gtron gadgetron"
alias viewer="gtron ismrmrdviewer"
alias hdfview="gtron hdfview"
alias gtronclient="gtron gadgetron_ismrmrd_client"


# defined below are docker aliases
DOCKERIMG=orbisys/gadgetron41:latest
alias gtrondocker="docker run --rm --user=developer -e DISPLAY=$DISPLAY -v $PWD:/mnt -v $DATADIR:/media -v /tmp/.X11-unix:/tmp/.X11-unix -v $HOME/.Xauthority:/home/developer/.Xauthority -it --net=host --pid=host --ipc=host $DOCKERIMG --homedir /mnt"
alias startServerdocker="gtrondocker gadgetron"
alias viewerdocker="gtrondocker ismrmrdviewer"
alias hdfviewdocker="gtrondocker hdfview"
alias gtronclientdocker="gtrondocker gadgetron_ismrmrd_client"

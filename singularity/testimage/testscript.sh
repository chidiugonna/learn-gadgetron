#!/bin/bash
DEST=/mnt/data
mkdir -p $DEST
cd /opt/gadgetron/test/integration
python3 get_data.py -d $DEST

# ensure singularity image called  with -B /$PWD:/mnt

TESTDIR=/mnt/testout
TESTCASE=simple_gre.cfg
cd /opt/gadgetron/test/integration
python3 run_gadgetron_test.py -d $DEST -t $TESTDIR ./cases/${TESTCASE}

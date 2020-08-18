# Lesson 2 - A practical introduction to Gadgetron

Open 2 terminals.
Ensure you are in the `Lesson_2` directory for each and execute code below:

    cd ./learn-gadgetron/learn/tutorial2020/Lesson_2
    source ../defineAliases.sh

**Note** that the defineAliases.sh binds local folders to internal folders in the Singularity container.
So `/mnt` in the container maps to the current directory i.e. `./learn-gadgetron/learn/tutorial2020/Lesson_2`
and `/media` in the container maps to the data folder for the tutorial at `../Gadgetron-2020-summer-school-data`


In one terminal start the gadgetron server

    source ../defineAliases.sh
    startServer


In a second terminal open  ismrmrdviewer and hdfview:

    source ../defineAliases.sh
    viewer /media/Day-1/Lecture-2/simple_gre.h5 &
    # after opening hdfview navigate to file and open simple_gre.h5 at location above
    hdfview &
    # this startst the custom visualization code 
    alias gtronvis="gtron visualize" 
    gtronvis &


In this terminal we will :

    gtronclient -f /media/Day-1/Lecture-2/simple_gre.h5 -C /mnt/config-fixed.xml

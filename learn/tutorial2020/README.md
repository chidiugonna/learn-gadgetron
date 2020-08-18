# Tutorial Spring 2020 
Resources for following the summer 2020 tutorial on gadgetron.

## Download data for the tutorial
Download 2 sets of data from [Part 1](https://doi.org/10.5281/zenodo.3888658) and [Part 2](https://zenodo.org/record/3906695#.XzrlsRllBhF) and unzip into ./learn-gadgetron/learn/tutorial2020
   
    unzip -o Gadgetron-2020-summer-school-data.zip 
    unzip -o Gadgetron-2020-Summer-School-data-part-2.zip
    cp -R Gadgetron-2020-Summer-School-data-part-2/* Gadgetron-2020-summer-school-data
    rm Gadgetron-2020-summer-school-data.zip
    rm Gadgetron-2020-Summer-School-data-part-2.zip
    rm -R Gadgetron-2020-Summer-School-data-part-2


Each Lesson has its own folder. Navigate to the folder to start as follows:

    cd Lesson_N
    # view lesson specific info
    more README.md

## Download the Tutorial files

in  separate folder from this repository but preferably alongside perform the following:

    git clone https://github.com/gadgetron/GadgetronOnlineClass.git



| Folder    | Official Title |
| ---       | ---  |
| Lesson_2  | Kristoffer Knudsen - A practical introduction to Gadgetron |

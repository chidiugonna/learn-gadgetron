# Repository to support learning of gadgetron


**Gadgetron** is an open source medical image reconstruction framework maintained by Michael Hansen and developed under a grant from the [NIH](https://grantome.com/grant/NIH/ZIA-HL006214-01).

A position paper is published and available [here](https://onlinelibrary.wiley.com/doi/full/10.1002/mrm.24389).

The homepage wiki is [here](https://github.com/gadgetron/gadgetron/wiki).

An online manual is [here](https://github.com/gadgetron/gadgetron/wiki/Manual).


This repository provides a recipe to build a singularity container containing useful elements of the gadgetron ecosystem to faciliate learning od gadgetron based on this tutorial that was developed in [spring 2020](https://github.com/gadgetron/GadgetronOnlineClass).

The gadgetron code itself is available [here](https://github.com/gadgetron/gadgetron).


To use this repository navigate to a home directory and:


    git clone https://github.com/chidiugonna/learn-gadgetron.git
    cd learn-gadgetron/singularity
    sudo singularity build [imagename].sif gadgetron-def


**References**

| Theme | Titles |
| --- | --- |
| Gadgetron Ecosystem  | Hansen, M. S., & Sørensen, T. S. (2013). Gadgetron: an open source framework for medical image reconstruction. Magnetic resonance in medicine, 69(6), 1768-1776. | 


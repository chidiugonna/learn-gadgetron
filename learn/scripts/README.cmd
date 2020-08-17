### Convenient aliases for calling the singularity container

source the `define_aliases.sh` script to create convenient command calls for commonly used commands.


After sourcing the script as follows:

`source define_aliases.sh` or `. define_aliases.sh` then the following commands can be used to access objects within the container.

`grtron [command]` will start any command that is accessible on the containers $PATH. The $PATH of the container can be viewed by using `gtron env | grep PATH=`

thus:

`gtron gadgetron` will start the gadgetron server in a command terminal

some shortcut aliases have been defined for convenience:

`startServer` is equivalent to `gtron gadgetron` and will also start the gadgetron server.
`viewer` is equivalent to `gtron ismrmrdviewer` and will start the ismrmrd viewer.
`hdfview` is equivalent to `gtron hdfview` and will start the hdf5 viewer 

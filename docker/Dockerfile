FROM ubuntu:bionic-20200713
MAINTAINER Chidi Ugonna<chidi_ugonna@hotmail.com.

RUN mkdir -p /xdisk /opt/data /opt/bin /opt/work /opt/input /opt/output /opt/config /opt/tmp  && \
    chmod -R 777 /opt
COPY ./src/startup.sh /opt/bin
COPY ./src/readme /opt/bin
COPY ./src/version /opt/bin


ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8   
ENV PATH=/opt/bin:$PATH
ENV PATH=/opt/miniconda/bin:$PATH   
ENV GADGETRON_HOME=/usr/local
ENV ISMRMRD_HOME=/usr/local    
ENV PATH=$PATH:$GADGETRON_HOME/bin:$ISMRMRD_HOME/bin
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ISMRMRD_HOME/lib:$GADGETRON_HOME/lib:/.singularity.d/libs:/usr/lib
ENV LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
ENV PATH=/usr/local/cuda/bin:$PATH
ENV HDFLIBS=/opt/hdfinstall/hdf5-1.10.6/hdf5
ENV HDF5LIBS=/opt/hdfinstall/hdf5-1.10.6/hdf5
ENV PATH=$PATH:/opt/ant/apache-ant-1.9.15/bin
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
ENV PATH=$PATH:$JAVA_HOME/bin
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/hdfinstall/hdf5-1.10.6/hdf5/lib/


RUN export DEBIAN_FRONTEND=noninteractive && \
    export TZ=America/Phoenix && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && \
    apt-get install -y \
    locales 

RUN echo "LC_ALL=en_US.UTF-8" >> /etc/environment && \
    echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && \
    echo "LANG=en_US.UTF-8" > /etc/locale.conf && \
    locale-gen en_US.UTF-8 && \
    export LC_ALL=en_US.UTF-8

RUN mkdir -p /opt/tmp

ARG TOTALCORES
ENV RUNCORES=$TOTALCORES

RUN apt-get install -y build-essential \
    git-core wget make cmake gcc-multilib libgtest-dev libboost-all-dev \
    libarmadillo-dev libopenblas-dev libfftw3-dev liblapack-dev liblapacke-dev \
    libxml2-dev libxslt-dev libpugixml-dev libhdf5-dev libplplot-dev libdcmtk-dev \
    python3-dev python3-pip python3-h5py python3-scipy python3-pyxb unzip nano curl


RUN apt-get update

#install CUDA 10.2
WORKDIR /opt/tmp
RUN wget http://developer.download.nvidia.com/compute/cuda/10.2/Prod/local_installers/cuda_10.2.89_440.33.01_linux.run && \
    sh cuda_10.2.89_440.33.01_linux.run --silent --toolkit --override --no-man-page --no-opengl-libs && \
    rm  cuda_10.2.89_440.33.01_linux.run

#miniconda
WORKDIR /opt/tmp      
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-py38_4.8.3-Linux-x86_64.sh && \
    chmod +x Miniconda3-py38_4.8.3-Linux-x86_64.sh && \
    /bin/bash ./Miniconda3-py38_4.8.3-Linux-x86_64.sh -b -p /opt/miniconda -f  && \
    conda install -y pip  && \
    conda install -y -c conda-forge numpy scipy matplotlib numpy-devel && \
    pip install pyxb

WORKDIR /opt
RUN git clone https://github.com/ismrmrd/ismrmrd.git   && \
    mkdir -p /opt/ismrmrd/build && cd /opt/ismrmrd/build  && \
    cmake ..  && \
    make -j $RUNCORES  && \
    make install

WORKDIR /opt
RUN git clone https://github.com/gadgetron/gadgetron.git && \
    cd /opt/gadgetron && \
    git checkout -f v4.1 && \
    mkdir -p /opt/gadgetron/build && cd /opt/gadgetron/build && \
    cmake .. && \
    make -j $RUNCORES && \
    make install  

WORKDIR /opt
RUN git clone https://github.com/ismrmrd/siemens_to_ismrmrd.git  && \
    mkdir -p /opt/siemens_to_ismrmrd/build && cd /opt/siemens_to_ismrmrd/build  && \
    cmake .. && \
    make -j $RUNCORES && \
    make install

WORKDIR /opt
RUN git clone https://github.com/ismrmrd/philips_to_ismrmrd.git && \
    mkdir -p /opt/philips_to_ismrmrd/build && cd /opt/philips_to_ismrmrd/build && \
    cmake .. && \
    make -j $RUNCORES  && \
    make install

WORKDIR /opt
RUN git clone https://github.com/ismrmrd/ismrmrd-python.git && \
    cd ismrmrd-python  && \
    python setup.py --verbose install

RUN apt-get install -y libglib2.0-0 libglu1-mesa qt5-default
WORKDIR /opt
RUN git clone https://github.com/ismrmrd/ismrmrdviewer.git  && \
    cd ismrmrdviewer  && \
    python setup.py --verbose install

# install python client
RUN pip install gadgetron 

RUN apt-get install -y openjdk-11-jdk
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64

#build with configure - this is the veriosn of hdf I need?
#https://portal.hdfgroup.org/display/knowledge/How+do+I+build+HDF5+from+source
RUN mkdir -p /opt/hdfinstall
WORKDIR /opt/hdfinstall
RUN wget https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-1.10/hdf5-1.10.6/src/hdf5-1.10.6.tar.gz && \
    tar xvf hdf5-1.10.6.tar.gz && \
    rm hdf5-1.10.6.tar.gz && \
    cd hdf5-1.10.6 && \
    ./configure --enable-java && \
    make && \
    make install

RUN mkdir -p /opt/ant
WORKDIR /opt/ant
RUN wget http://mirror.cc.columbia.edu/pub/software/apache//ant/binaries/apache-ant-1.9.15-bin.zip && \
    unzip apache-ant-1.9.15-bin.zip && \
    rm apache-ant-1.9.15-bin.zip

WORKDIR /opt/
RUN wget https://support.hdfgroup.org/ftp/HDF5/releases/HDF-JAVA/hdfview-3.1.1/src/hdfview-3.1.1.tar.gz && \
    tar xvf hdfview-3.1.1.tar.gz && \
    rm hdfview-3.1.1.tar.gz 

WORKDIR /opt/hdfview-3.1.1
ENV HDFLIBS=/opt/hdfinstall/hdf5-1.10.6/hdf5
ENV HDF5LIBS=/opt/hdfinstall/hdf5-1.10.6/hdf5
ENV PATH=$PATH:/opt/ant/apache-ant-1.9.15/bin
ENV PATH=$PATH:$JAVA_HOME/bin
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/hdfinstall/hdf5-1.10.6/hdf5/lib/

RUN ant compile jar

RUN echo java -jar /opt/hdfview-3.1.1/build/jar/HDFView.jar >> /opt/bin/hdfview && \
    chmod +x /opt/bin/hdfview


WORKDIR /opt
RUN git clone https://github.com/gadgetron/GadgetronOnlineClass.git

RUN echo cd /opt/GadgetronOnlineClass/Courses/Day1/Lecture2/visualization/ >> /opt/bin/visualize && \
    echo python3 visualization.py >> /opt/bin/visualize && \
    chmod +x /opt/bin/visualize

# Replace 1000 with your user / group id
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/developer && \
    mkdir -p /etc/sudoers.d && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown ${uid}:${gid} -R /home/developer

ENV USER=developer
ENV HOME=/home/developer

ENTRYPOINT ["/opt/bin/startup.sh"]
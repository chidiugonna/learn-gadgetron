% Gadgetron ISMRMRD client
%   -- host            :      localhost
%   -- port            :      9002
%   -- hdf5 file  in   :      /mnt/results/testdata.h5
%   -- hdf5 group in   :      /dataset
%   -- conf            :      default.xml
%   -- loop            :      1
%   -- hdf5 file out   :      /mnt/results/out.h5
%   -- hdf5 group out  :      2020-08-14 10:26:01

% obtain DATE from hd5 group out
DATE='2020-08-14 10:26:01';
images = h5read('./results/out.h5',sprintf('/%s/image_0/data',DATE));
imagesc(images(:,:,1,1));colormap(gray);

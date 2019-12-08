clear
clc

im_sawtooth = imread('sawtooth.bmp');

disk_se = strel('disk',20);

im_open = imopen(im_sawtooth, disk_se);
im_open_pixels = sum(sum(im_open == 255));

for i = 1:10
    im_open = imopen(im_open, disk_se);
    im_open_pixels = sum(sum(im_open == 255));
    sprintf('The pixels of open is %d',im_open_pixels)
end
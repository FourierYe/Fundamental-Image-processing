clear
clc

im = imread('lenna512.bmp');
im = im2double(im);

my_dct2 = @(block_struct) dct2(block_struct);
im_dct = blkproc(im,[8 8],my_dct2);
figure(1)
imshow(im_dct)
% im_dct = im2uint8(im_dct);
% imshow(im_dct);

my_merge = @(block_struct) block_struct(1,1)/max(max(im_dct));
ims = blkproc(im_dct,[8 8],my_merge);

figure(2)
imshow(im2uint8(ims));
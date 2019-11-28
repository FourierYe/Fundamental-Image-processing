clear
clc

im = imread('lenna512.bmp');

% generate error image
im_error = generateDPCM(im)

% imshow(im_error);

im_error_entropy = my_entropy(im_error)
im_entropy = my_entropy(im)

clear
clc

im = imread('lenna512.bmp');
im_entropy = my_entropy(im);

im_half = down_samping(im);

im_half_entropy = my_entropy(im_half);

im_quantization = im./16*16;
im_quantization_entropy = my_entropy(im_quantization);

% As we can see from result, if we convert image to half size of original image.
% the entropy doesn't change too much.
% But when we use quantization, the magnitude of information will be reduced.
% Because uncertainty of whole image come down


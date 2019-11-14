clear
clc

im = imread('lenna512.bmp');
im_entropy = my_entropy(im)

% im_half1 = imresize(im, 0.5,'nearest');
% im_half2 = imresize(im, 0.5,'bilinear');
% im_half3 = imresize(im, 0.5,'bicubic');
im_half = down_samping(im);

% im_half1_entropy = my_entropy(im_half1)
% im_half2_entropy = my_entropy(im_half2)
% im_half3_entropy = my_entropy(im_half3)
im_half_entropy = my_entropy(im_half);

partion = 256/16-1 : 16:255

image_reshaped = reshape(im,[1,512*512]);
image_reshaped = quantiz(image_reshaped, partion);

image_original = reshape(image_reshaped,[512,512]);

image_original = uint8(image_original);
im_quantization = my_entropy(image_original);

% As we can see from result, if we convert image to half size of original image.
% the entropy doesn't change too much.
% But when we use quantization, the magnitude of information will be reduced.
% Because uncertainty of whole image come down


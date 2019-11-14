clear
clc

im = imread('lenna512.bmp');
im_entropy = my_entropy(im)

im_half1 = imresize(im, 0.5,'nearest');
im_half2 = imresize(im, 0.5,'bilinear');
im_half3 = imresize(im, 0.5,'bicubic');
im_half4 = down_samping(im);

im_half1_entropy = my_entropy(im_half1)
im_half2_entropy = my_entropy(im_half2)
im_half3_entropy = my_entropy(im_half3)
im_half4_entropy = my_entropy(im_half4)

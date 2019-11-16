clear
clc

im = imread('lenna512.bmp');

ims = generate_ims(im);
figure(1)
imshow(im2uint8(ims));
figure(2)
imshow(im)
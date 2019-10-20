clear
clc
im = imread('lenna512.bmp');
im_SP = generate_saltpepper(im, 0.1);
imshow(im_SP);
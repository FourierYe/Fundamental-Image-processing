clear
clc
im = imread('lenna512.bmp');
[m, n] = size(im);

variance = 10;
sigma = sqrt(variance);
mu = 0;

im_wn = guassian_noise(im, mu, sigma)

imshow(im_wn)
title('guassian points')

psnr = psnr(im,im_wn)
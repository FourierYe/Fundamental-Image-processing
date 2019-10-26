clear
clc

im = imread('lenna512.bmp');
im_SP = generate_saltpepper(im, 0.1);
PSNR_SP = psnr(im, im_SP)

im_wn =guassian_noise(im,0,sqrt(10));
PSNR_WN = psnr(im, im_wn)

im_low = imread('lenna512_low_dynamic_range.bmp');
PSNR_low = psnr(im, im_low)
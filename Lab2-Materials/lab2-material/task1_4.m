clear
clc
im = imread('lenna512.bmp');
im_SP = generate_saltpepper(im, 0.1);
PSNR_SP = CalculatePSNR(im, im_SP)

 im = im2double(im);
 [m, n] = size(im);
 im_wn =createimwithwn(im);
 PSNR_WN = CalculatePSNR(im, im_wn)
 
 im_low = imread('lenna512_low_dynamic_range.bmp');
 PSNR_low = CalculatePSNR(im, im_low)
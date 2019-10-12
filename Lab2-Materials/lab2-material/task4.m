clear
clc

im = imread('lenna512.bmp');

im_sp = generate_saltpepper(im, 0.1);

figure(1)
imshow(im_sp)

im_recover_3 = median_filter(im_sp, 3);
figure(1);
imshow(uint8(  im_recover_3));
psnr_filter3 = CalculatePSNR(im, im_recover_3)
im_recover_5 = median_filter(im_sp, 5);
figure(2)
imshow(uint8(im_recover_5));
psnr_filter5 = CalculatePSNR(im, im_recover_5)

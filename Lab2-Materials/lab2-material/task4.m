clear
clc

im = imread('lenna512.bmp');

im_sp = generate_saltpepper(im, 0.1);

% 3*3 filter
im_recover_3 = median_filter(im_sp, 3);
figure(1);
imshow(uint8(im_recover_3));
title('3*3 filter')
psnr_filter3 = CalculatePSNR(im, im_recover_3);

% 5*5 filter
im_recover_5 = median_filter(im_sp, 5);
figure(2);
imshow(uint8(im_recover_5));
title('5*5 filter')
psnr_filter5 = CalculatePSNR(im, im_recover_5);

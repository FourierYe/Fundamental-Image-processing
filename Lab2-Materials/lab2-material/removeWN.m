clear
clc
im = imread('lenna512.bmp')
[m, n] = size(im);
sum = zeros(m,n);

for i=1:10
    im_wn = guassian_noise(im,0,sqrt(10));
    im_wn = double(im_wn);
    sum = sum + im_wn;
end

im_wn10 = sum/10;
im_wn10 = uint8(im_wn10);

figure(1)
imshow(im_wn10);
title('im10 after');

psnr_im_wn10 = psnr(im, im_wn10);

sum = zeros(m,n);
for i=1:100
    im_wn = guassian_noise(im,0,sqrt(10));
    im_wn = double(im_wn);
    sum = sum + im_wn;
end

im_wn100 = sum/100;
im_wn100 = uint8(im_wn100)

figure(2)
imshow(im_wn100);
title('im100 after')

psnr_im_wn100 = psnr(im, im_wn100);


sum = zeros(m,n);
for i=1:1000
    im_wn = guassian_noise(im,0,sqrt(10));
    im_wn = double(im_wn);
    sum = sum + im_wn;
end

im_wn1000 = sum/1000;
im_wn1000 = uint8(im_wn1000);

figure(3)
imshow(im_wn1000);
title('im1000 after')

psnr_im_wn1000 = psnr(im, im_wn1000);

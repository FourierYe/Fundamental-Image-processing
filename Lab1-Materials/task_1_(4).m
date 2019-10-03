% convert rgb into binary space

image=imread('lenna512.bmp');

subplot(2,2,1);
imshow(image);
title('original picture');

% use library to implement
Image_binary=im2bw(image)
subplot(2,2,2);
imshow(Image_binary);
title('lib to implement')

% use 256/2-1=127 as a threshold to convert
Image_binary = image>127;
subplot(2,2,3);
imshow(Image_binary);
title('127 threshold');

% use mean as a threshold to convert
[m,n]=size(image);
Image_binary = im2double(image) > sum(sum(im2double(image)))/(m*n);
subplot(2,2,4)
imshow(Image_binary)
title('mean threshold');
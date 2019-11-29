clear 
clc

im = imread('sawtooth.bmp');

im = im2bw(im);

circle_se = strel('disk',10);

im_erode = imerode(im, circle_se); 

im_dilate = imdilate(im, circle_se);

figure(1)
imshow(im);
title('im')

figure(2)
imshow(im_erode);
title('im\_erode')

figure(3)
imshow(im_dilate);
title('im\_dilate')

im_edge = im_dilate - im_erode;

figure(4)
imshow(im_edge)
title('edge')


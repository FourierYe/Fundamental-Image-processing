im = imread('lenna512.bmp')

dct_im = dct2(im);

figure(1)
imshow(uint8(dct_im));
title('dct\_im')

im_inversed = idct2(dct_im);
figure(2)
imshow(uint8(im_inversed));
title('inversed\_im')

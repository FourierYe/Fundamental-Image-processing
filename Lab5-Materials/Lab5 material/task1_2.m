clear
clc

im = imread('sawtooth.bmp');
subplot(3,2,1)
imshow(im)
title('original image')
disk_se = strel('disk',10);

im_erosion = imerode(im,disk_se);
subplot(3,2,2)
imshow(im_erosion)
title('im erosion')
im_erosion_pixels = sum(sum(im_erosion == 255));


im_dilate = imdilate(im,disk_se);
subplot(3,2,3)
imshow(im_dilate)
title('im dilate')
im_dilate_pixels = sum(sum(im_dilate == 255));


im_open = imopen(im,disk_se);
subplot(3,2,4)
imshow(im_open)
title('im open')
im_open_pixels = sum(sum(im_open == 255));


im_close = imclose(im,disk_se);
subplot(3,2,5)
imshow(im_close)
title('im close')
im_close_pixels = sum(sum(im_close == 255));


% As we can see from result, the pixel of open is more than that of erosion.








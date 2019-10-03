image = imread('lenna512.bmp');
image_narrow = narrow_down(image);

image_recover = biliner_interpolation_1(im2uint8(image_narrow), 2);

subplot(2,1,1)
imshow(image)
title('original image')

subplot(2,1,2)
imshow(image_recover)
title('image recover')

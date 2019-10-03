image=imread('lenna512.bmp')
% if we don't multiply 16 again, the image will be dark
image_8=(image./16+1)*16-1;
figure(1)
imshow(image)
title('Original image with 256 depth')

figure(2)
imshow(image_8)
title('Image with 8 depth')
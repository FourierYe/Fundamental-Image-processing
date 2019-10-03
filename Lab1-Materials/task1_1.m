% task 1
% load image
image = imread('lenna512color.bmp');

% create 3 copies of orginal image 
RGB_R_component=image;
RGB_G_component=image;
RGB_B_component=image;

% remove 2 component respectively
RGB_R_component(:,:,[2 3])=0;
RGB_G_component(:,:,[1 3])=0;
RGB_B_component(:,:,[1 2])=0;

% show images respectively
subplot(2,2,1)
imshow(image)
title('Original image')

subplot(2,2,2)
imshow(RGB_R_component)
title('R component')

subplot(2,2,3)
imshow(RGB_G_component)
title('G component')

subplot(2,2,4)
imshow(RGB_B_component)
title('B component')

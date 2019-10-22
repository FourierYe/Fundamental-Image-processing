clear
clc
im = imread('lenna512.bmp')
im_low_dynamic_range = imread('lenna512_low_dynamic_range.bmp')

[m,n]=size(im_low_dynamic_range);
after_image = zeros(m,n);

for i=1:m
    for j=1:n
        after_image(i,j)=piecewise_enhance(im_low_dynamic_range(i,j));
    end
end
% 
% figure(1)
% imshow(uint8 ( after_image))
% title('enhanced image')
% figure(2)
% imhist(uint8 ( after_image))
% title('enhanced image')

% figure(3)
% imshow(im)
% title('original image')
% figure(4)
% imhist(im)
% title('original image')


enhanced_im_by_tool = histeq(im_low_dynamic_range)
figure(5)
imshow(enhanced_im_by_tool)
title('enhanced_im_by_tool')
figure(6)
imhist(enhanced_im_by_tool)
title('enhanced_im_by_tool')

figure(7)
imshow(im_low_dynamic_range)
title('im_low_dynamic_range')
figure(8)
imhist(im_low_dynamic_range)
title('im_low_dynamic_range')
% 
% figure(4)
% imhist(im)
% figure(2)
% histeq(im)

% I think it is very difficult to decide a best piece-wise to enchance image.
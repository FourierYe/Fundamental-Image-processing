clear
clc
im = imread('lenna512.bmp')
im_low_dynamic_range = imread('lenna512_low_dynamic_range.bmp')

[m,n]=size(im_low_dynamic_range);

im_low_dynamic_range = double(im_low_dynamic_range);
after_image = piecewise_enhance(im_low_dynamic_range);

after_image = uint8(after_image);

psnr_enhanced_im = psnr(im, after_image);

figure(1)
imshow(uint8 ( after_image));
title('optimal parameters')

figure(2)
imhist(uint8 ( after_image))    
title('enhanced image')

figure(3)
imshow(im)
title('original image')
figure(4)
imhist(im)
title('original image')

% 
% enhanced_im_by_tool = histeq(im_low_dynamic_range)
% 
% psnr_histeq = psnr(im, enhanced_im_by_tool)
% 
% 
% 
% figure(7)
% imshow(im_low_dynamic_range)
% title('im low dynamic range')
% figure(8)
% imhist(im_low_dynamic_range)
% title('im low dynamic range')
% 
% figure(5)
% imshow(enhanced_im_by_tool)
% title('enhanced im by tool')
% figure(6)
% imhist(enhanced_im_by_tool)
% title('enhanced im by tool')

% 
% figure(4)
% imhist(im)
% figure(2)
% histeq(im)

% I think it is very difficult to decide a best piece-wise to enchance image.
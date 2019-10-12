subplot(2,2,1)
imhist(im2uint8(im))
subplot(2,2,2)
imhist(im2uint8(im_wn))
% equalization
subplot(2,2,3)
imhist(im_SP)
% add some points in 0 and 255
subplot(2,2,4)
imhist(im_low)
points concentrate on the interval
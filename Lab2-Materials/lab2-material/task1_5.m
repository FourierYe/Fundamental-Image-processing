subplot(2,2,1)
imhist(im2uint8(im))
title('original image')
subplot(2,2,2)
imhist(im2uint8(im_wn))
title('im_ wn image')
% equalization
subplot(2,2,3)
imhist(im_SP)
title('im_ SP image')
% add some points in 0 and 255
subplot(2,2,4)
imhist(im_low)
title('im_ low image')
% points concentrate on the interval
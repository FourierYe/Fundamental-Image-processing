% mean zoom out
image_gray=imread('lenna512.bmp');
image_narrow=narrow_down(image_gray);
figure(1)
imshow(image_narrow)
title('zoom out')

image_zoom_neighbor_interpolation=neighbor_interpolation(image_narrow);
figure(2)
imshow(image_zoom_neighbor_interpolation)
title('zoom in by neighbor interpolation')

% biliner interpolation
image_zoom_biliner_interpolation=biliner_interpolation_1(im2uint8(image_narrow),2);
figure(3)
imshow(image_zoom_biliner_interpolation)
title('zoom in by biliner interpolation')


% bicubic interpolation
[X,Y]=meshgrid(0:255)
[XQ,YQ]=meshgrid(0:0.5:255)

% padding block
image_zoom_cubic_interpolation=interp2(X,Y,image_narrow,XQ,YQ,'cubic')
image_zoom_cubic_interpolation=[image_zoom_cubic_interpolation,image_zoom_cubic_interpolation(:,end)];
image_zoom_cubic_interpolation=[image_zoom_cubic_interpolation;image_zoom_cubic_interpolation(end,:)];
figure(4)
imshow(image_zoom_cubic_interpolation)
title('zoom in by cubic interpolation')

% Calculate PSNR respectively

PSNR_neighbor=CalculatePSNR(image_gray,im2uint8(image_zoom_neighbor_interpolation))
PSNR_biliner_interpolation=CalculatePSNR(image_gray, im2uint8(image_zoom_biliner_interpolation))
PSNR_cubic_interpolation=CalculatePSNR(image_gray, im2uint8(image_zoom_cubic_interpolation))



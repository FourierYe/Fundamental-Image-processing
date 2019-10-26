im = imread('lenna512.bmp');
im = im2double((im));
sobel_vertical=[1.0 2.0 1.0;0.0 0.0 0.0; -1.0 -2.0 -1.0];
sobel_horizontal=[-1.0 0.0 1.0; -2.0 0.0 2.0; -1.0 0.0 1.0];
sobel_threshold_all = 0.5;

horizontal_detection = abs(imfilter(im, sobel_horizontal));

vertical_detection = abs(imfilter(im, sobel_vertical));

all_detection = sqrt(horizontal_detection.^2+(vertical_detection).^2);

% make all points at 0-255 and convert it into 0-1
all_detection = im2double(im2uint8(all_detection))

completed_detection = all_detection > sobel_threshold_all


figure(1)
imshow(horizontal_detection)
title('horizontal detection')
figure(2)
imshow(vertical_detection)
title('vertical detection')
figure(3)
imshow(completed_detection)
title('all detection')
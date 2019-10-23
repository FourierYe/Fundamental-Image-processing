im = imread('lenna512.bmp');
im = im2double((im));
sobel_vertical=[1.0 2.0 1.0;0.0 0.0 0.0; -1.0 -2.0 -1.0];
sobel_horizontal=[-1.0 0.0 1.0; -2.0 0.0 2.0; -1.0 0.0 1.0];

horizontal_detection = imfilter(im, sobel_horizontal);
vertical_detection = imfilter(im, sobel_vertical);
all_detection = sqrt(horizontal_detection.^2+vertical_detection.^2);

figure(1)
imshow(horizontal_detection)
title('horizontal detection')
figure(2)
imshow(vertical_detection)
title('vertical detection')
figure(3)
imshow((all_detection))
title('all detection')
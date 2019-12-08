clear 
clc

im_sawtooth = imread('sawtooth.bmp');

% dilate method return dilated image - image
im_sawtooth_boundary = get_boundary(im_sawtooth);
figure(1)
imshow(im_sawtooth_boundary);
title('my morphology method');

% build-in sobel operation
im_sawtooth_edge = edge(im_sawtooth,'sobel');
figure(2)
imshow(im_sawtooth_edge);
title('Build-in Sobel method');

% build-in function
im_sawtooth_perim = bwperim(im_sawtooth,4)
figure(3)
imshow(im_sawtooth_perim)
title('Build-in morphology method');
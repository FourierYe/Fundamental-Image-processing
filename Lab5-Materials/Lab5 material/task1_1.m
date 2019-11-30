clear 
clc

im_sawtooth = imread('sawtooth.bmp');

im_sawtooth_boundary = get_boundary(im_sawtooth);

imshow(im_sawtooth_boundary);

title('The boundary of sawtooth');

im_sawtooth_edge = edge(im_sawtooth,'sobel');
figure(2)
imshow(im_sawtooth_edge);

im_sawtooth_perim = bwperim(im_sawtooth,4)

figure(3)
imshow(im_sawtooth_perim)
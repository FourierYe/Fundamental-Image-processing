clear
clc

im = imread('lenna512.bmp');

im_low_dynamic_range = imread('lenna512_low_dynamic_range.bmp');

[m, n] = size(im_low_dynamic_range);

reconstructed_im = zeros(m,n);

% count pixels

pixels = linspace(0,0,256);

for i = 1:m
    for j = 1:n
        index = im_low_dynamic_range(i,j)-1;
        pixels(index) = pixels(index) + 1;
    end
end

% reconstruct image
A_0 = m*n;
L = 255;
for i = 1:m
    for j =1:n
       value_pixel = im_low_dynamic_range(i,j);
       sum = 0;
       for k = 1:value_pixel+1
           sum = sum + pixels(k);
       end
       reconstructed_im(i,j) =  L/A_0 *sum;
    end 
end

figure(1)
imshow(uint8(reconstructed_im));


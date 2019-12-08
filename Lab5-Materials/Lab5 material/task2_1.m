clear
clc

car_license_plate = imread('car_license_plate.bmp');
alphanumeric_templates = imread('alphanumeric_templates .bmp');

% because I use the build-in function to Binarizate image
% however the threshold of im2bw must at 0-1
% therefore I choose 0.5 as a threshold
my_threshold = 0.5;

car_license_binary = im2bw(car_license_plate,my_threshold);

% segment car license binary
index = find(sum(~car_license_binary,1) == max(sum(~car_license_binary,1)))

left = min(index)

right = max(index)

index = find(sum(~car_license_binary,2) == max(sum(~car_license_binary,2)))

top = min(index)

bottom = max(index)

car_license_binary = car_license_binary([top:bottom],[left:right])

alphanumeric_templates_binary = im2bw(alphanumeric_templates, my_threshold);

alphanumeric_templates_binary = ~alphanumeric_templates_binary;
figure(1)
imshow(car_license_binary)
title('car\_license\_binary')

figure(2)
imshow(alphanumeric_templates_binary)
title('alphanumeric\_templates\_binary')
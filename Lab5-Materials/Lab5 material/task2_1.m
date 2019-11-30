clear
clc

car_license_plate = imread('car_license_plate.bmp');
alphanumeric_templates = imread('alphanumeric_templates .bmp');

my_threshold = 0.5;

car_license_binary = im2bw(car_license_plate,my_threshold);

alphanumeric_templates_binary = im2bw(alphanumeric_templates, my_threshold);


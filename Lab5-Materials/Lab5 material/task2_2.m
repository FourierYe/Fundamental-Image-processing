clear
clc

car_license_plate = imread('car_license_plate.bmp');

alphanumeric_templates = imread('alphanumeric_templates .bmp');

car_character_v1 = detect_car_license_plate_v1(car_license_plate, alphanumeric_templates);

car_character_v3 = detect_car_license_plate_v3(car_license_plate, alphanumeric_templates);

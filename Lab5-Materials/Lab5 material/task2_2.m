clear
clc

car_license_plate = imread('car_license_plate.bmp');

alphanumeric_templates = imread('alphanumeric_templates .bmp');

my_threshold = 0.5;

car_license_binary = im2bw(car_license_plate,my_threshold);
% segment car license
character_im = segment_car_license(car_license_binary);

alphanumeric_templates_binary = im2bw(alphanumeric_templates, my_threshold);

map_container = im_map_character(alphanumeric_templates_binary);

alphabet = map_container.keys;

length_alphabet = length(alphabet);
length_character = length(character_im);

str = []


for i = 1:length_character
    
    for j = 1:length_alphabet
        
        E_strel = map_container(alphabet{j});
        
        im_test = imerode(character_im{i},E_strel);
        
        is_mattched = sum(sum(im_test)) ==1;
        
        if is_mattched
            break
        end
    end
    
    if is_mattched
        str = [str alphabet{j}]
        sprintf('The character is %s',alphabet{j})
    end
end


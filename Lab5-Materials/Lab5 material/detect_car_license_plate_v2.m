function  car_character = detect_car_license_plate_v2(car_license_plate,alphanumeric_templates)

my_threshold = 0.5;

car_license_binary = im2bw(car_license_plate,my_threshold);

% segment car license
character_im = segment_car_license(car_license_binary);

alphanumeric_templates_binary = im2bw(alphanumeric_templates, my_threshold);

map_container = im_map_character(alphanumeric_templates_binary);

alphabet = map_container.keys;

length_alphabet = length(alphabet);
length_character = length(character_im);

car_character = []


for i = 1:length_character
    
    for j = 1:length_alphabet
        
        E_strel_1 = map_container(alphabet{j});
        
        disk_se = strel('disk',1);
        
        E_strel_1 = imerode(E_strel_1,disk_se);
        
        E_strel_2 = edge(E_strel_1);
        
        im_test = bwhitmiss(character_im{i},E_strel_1,E_strel_2);
        
        is_mattched = sum(sum(im_test)) ==1;
        
        if is_mattched
            break
        end
    end
    
    if is_mattched
        car_character = [car_character alphabet{j}]
        sprintf('The character is %s',alphabet{j})
    end
end

end


%         E_strel_1 = map_container('I');
% 
%         E_strel_2 = edge(E_strel_1);
% 
%         im_test = bwhitmiss(character_im{4},E_strel_1,E_strel_2);
function  car_character = detect_car_license_plate_v2(car_license_plate,alphanumeric_templates)

my_threshold = 0.5;

car_license_binary = im2bw(car_license_plate,my_threshold);

% segment car license
[m,n] = size(car_license_binary);

index = find(sum(~car_license_binary,1) == max(sum(~car_license_binary,1)))

left = min(index)

right = max(index)

index = find(sum(~car_license_binary,2) == max(sum(~car_license_binary,2)))

top = min(index)

bottom = max(index)

car_license_binary = car_license_binary([top:bottom],[left:right])

alphanumeric_templates_binary = im2bw(alphanumeric_templates, my_threshold);

map_container = im_map_character(alphanumeric_templates_binary);

alphabet = map_container.keys;

length_alphabet = length(alphabet);

car_character = [];



for j = 1:length_alphabet
    
    E_strel_1 = map_container(alphabet{j});
    
    E_strel_2 = get_boundary(E_strel_1);
    
    im_test_1 = imerode(car_license_binary,E_strel_1);
    
    disk_se = strel('disk',1);
    
    car_license_binary = imerode(car_license_binary,disk_se);
    
    im_test_2 = imerode(~car_license_binary,E_strel_2);
    
    im_test = im_test_1 & im_test_2;
    
    %         im_test = bwhitmiss(character_im{i},E_strel_1,E_strel_2);
    
    is_mattched = sum(sum(im_test)) ==1;
    
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
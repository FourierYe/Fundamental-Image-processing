function character_im = segment_car_license(car_license_binary)

[m,n] = size(car_license_binary);

index = find(sum(~car_license_binary,1) == max(sum(~car_license_binary,1)))

left = min(index)

right = max(index)

index = find(sum(~car_license_binary,2) == max(sum(~car_license_binary,2)))

top = min(index)

bottom = max(index)

car_license_binary = car_license_binary([top:bottom],[left:right])

[m,n] = size(car_license_binary);

left = min(find(sum(car_license_binary,2) >= 1)) -1;
right = max(find(sum(car_license_binary,2) >= 1)) +1;
car_license_binary = car_license_binary([left: right],:);
column_position_list = [];

start_signal = 1

for i = 1:n
    %     detect point of incision
    is_segment_point_left = sum(car_license_binary(:,i)) >= 1;
    is_segment_point_right = sum(car_license_binary(:,i)) < 1;
    if is_segment_point_left & start_signal
        column_position_list = [column_position_list i];
        start_signal = ~start_signal;
    elseif is_segment_point_right & ~start_signal
        column_position_list = [column_position_list i];
        start_signal = ~start_signal;
    end
end

length_position = length(column_position_list);

character_im = {};

for i = 1:2:length_position
    left = column_position_list(i)-3;
    right = column_position_list(i+1)+3;
    character_im = [character_im ;car_license_binary(:,(left:right))];
end

end
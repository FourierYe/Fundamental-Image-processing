function map_container = im_map_character(alphanumeric_templates_binary)

[m,n] =size(alphanumeric_templates_binary)

alphanumeric_templates_binary = ~alphanumeric_templates_binary;

row_position_list = []

start_signal = 1

for i = 1:m
    %     detect point of incision
    is_segment_point_top = sum(alphanumeric_templates_binary(i,:)) >= 1;
    is_segment_point_bottom = sum(alphanumeric_templates_binary(i,:)) < 1;
    if is_segment_point_top & start_signal
        row_position_list = [row_position_list i-1];
        start_signal = ~start_signal;
    elseif is_segment_point_bottom & ~start_signal
        row_position_list = [row_position_list i+1];
        start_signal = ~start_signal;
    end
    
end


column_position_list = [];

start_signal = 1

for i = 1:n
    %     detect point of incision
    is_segment_point_left = sum(alphanumeric_templates_binary(:,i)) >= 1;
    is_segment_point_right = sum(alphanumeric_templates_binary(:,i)) < 1;
    if is_segment_point_left & start_signal
        column_position_list = [column_position_list i-1];
        start_signal = ~start_signal;
    elseif is_segment_point_right & ~start_signal
        column_position_list = [column_position_list i+1];
        start_signal = ~start_signal;
    end
end

length_position = length(row_position_list);

character_im = {};

for i = 1:2:length_position
    
    for j = 1:2:length_position
        top = row_position_list(i);
        bottom = row_position_list(i+1);
        left = column_position_list(j);
        right = column_position_list(j+1);
        character_im = [character_im ;alphanumeric_templates_binary((top:bottom),(left:right))];
    end
end

character_dictionary = {'A','B','C','D','E','F',...
    'G','H','I','J','K','L',...
    'M','N','O','P','Q','R',...
    'S','T','U','V','X','Y',...
    'Z','W','1','2','3','4',...
    '5','6','7','8','9','0'}

% map character with image
map_container = containers.Map(character_dictionary,character_im)

end